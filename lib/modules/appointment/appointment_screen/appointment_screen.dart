import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/appointment/appointment_screen/cubit/cubit.dart';
import 'package:solar_system/modules/appointment/appointment_screen/cubit/states.dart';
import 'package:solar_system/modules/appointment/appointment_screen/widget/listview_costumer_orders_widget/listview_costumer_orders_widget.dart';

import 'package:solar_system/shared/const/const.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppointmentCubit.get(context);
    cubit.getAllCustomerOrders(token: token.toString());
    return BlocConsumer<AppointmentCubit, AppointmentStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetAllCustomerOrdersLoadingState,
          builder: ((context) {
            if (state is GetAllCustomerOrdersSuccessState ||
                cubit.allCustomerAppointment != null) {
              return ListViewCostumerOrderWidget(
                ordersCostumer: cubit.allCustomerAppointment!.data![0].order!,
                allCustomerAppointment: cubit.allCustomerAppointment,
              );
            }
            return const Center(child: Text('No data'));
          }),
          fallback: ((context) {
            return const Center(child: CircularProgressIndicator());
          }),
        );
      },
    );
  }
}
