import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';

import '../../../../../models/model_appointment_screen.dart';
import '../../../../../shared/const/const.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class RejectWidget extends StatelessWidget {
  const RejectWidget({super.key, required this.orderCostumer});
  final Order orderCostumer;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);
        return BlocConsumer<AppointmentCubit, AppointmentStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubitAppointment = AppointmentCubit.get(context);
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size((MediaQuery.of(context).size.width - 220), 40),
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // title: const Text(
                        //   '',
                        //   style: TextStyle(
                        //     color: Colors.brown,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        content: const Text(
                          'Are you sure to reject this request?',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Approve',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              cubit.orderStatus(
                                  token: token.toString(),
                                  idOrder: orderCostumer.id!.toInt(),
                                  status: "Rejected");

                              cubitAppointment.getAllCustomerOrders(
                                  token: token.toString());

                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              child: const Text('Reject'),
            );
          },
        );
      },
    );
  }
}
