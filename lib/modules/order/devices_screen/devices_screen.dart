import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/models/model_appointment_orders_screen.dart';

import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';

import 'package:solar_system/modules/order/devices_screen/widget/list_view_widget.dart';

import '../../../shared/components/drawer_widget/list_view_drawer_widget.dart';
import '../../../shared/const/const.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  //Data dev;
  //DevicesScreen({required this.dev});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    AppointmentOrdersModel? orderDevices;
    if (arg != null) {
      orderDevices = arg['orderDevices'];
    }

    var cubit = DevicesCubit.get(context);
    cubit.getAllDevices(token: token.toString());

    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            child: ListViewDrawerWidget(
              name: name,
              emil: email,
            ),
          ),
          body: ConditionalBuilder(
              condition: state is! GetAllDevicesLoadingState,
              builder: ((context) {
                if (state is GetAllDevicesSuccessState ||
                    cubit.devices != null) {
                  return ListViewWidget(
                    devices: cubit.devices,
                    //isChecked: cubit.isChecked,
                    deviceCheck: cubit.deviceCheck,
                    orderDevices: orderDevices,
                  );
                }

                return const Center(child: Text("No Data"));
              }),
              fallback: ((context) {
                return const Center(child: CircularProgressIndicator());
              })),
        );
      },
    );
  }
}
