import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/appointment/appointment_screen/cubit/states.dart';
import 'package:solar_system/modules/appointment/view_the_appointment_orders_screen/widget/list_view_device_widget/list_view_device_widget.dart';
import 'package:solar_system/modules/appointment/view_the_appointment_orders_screen/widget/list_view_products_widget/grid_view_products_widget.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';

import '../appointment_screen/cubit/cubit.dart';

class ViewTheAppointmentOrders extends StatelessWidget {
  const ViewTheAppointmentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubitAppointment = AppointmentCubit.get(context);
        return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
              condition: state is! GetOrderByIdLoadingState,
              builder: (context) {
                if (cubitAppointment.orderForAppointment != null) {
                  return Column(
                    children: [
                      GridViewProductWidget(
                        products: cubitAppointment
                            .orderForAppointment!.data!.products,
                      ),
                      ListViewDeviceWidget(
                        devices:
                            cubitAppointment.orderForAppointment!.data!.devices,
                      ),
                      if (cubitAppointment
                              .orderForAppointment!.data!.appointment!.type !=
                          'installation')
                        BlocConsumer<DevicesCubit, DevicesStates>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            var cubit = DevicesCubit.get(context);

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      // backgroundColor: Colors.red,
                                      // foregroundColor: Color(0xff964B00),
                                      // side: const BorderSide(
                                      //   color: Color(0xff964B00),
                                      //   width: 1,
                                      // ),
                                      ),
                                  onPressed: () {
                                    cubit.totalWatt = 0;
                                    cubit.deviceCheck = [];
                                    Navigator.pushNamed(
                                        context, '/DevicesScreen', arguments: {
                                      'orderDevices':
                                          cubitAppointment.orderForAppointment
                                    });
                                  },
                                  child: const Text('Modify The Request'),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  );
                }
                return const Center(child: Text("NO INTERNET"));
              },
              fallback: (context) {
                return const Center(child: CircularProgressIndicator());
              },
            ));
      },
    );
  }
}
