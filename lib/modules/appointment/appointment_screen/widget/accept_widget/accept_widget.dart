import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/model_appointment_screen.dart';
import '../../../../../shared/const/const.dart';
import '../../../../order/devices_screen/cubit/cubit.dart';
import '../../../../order/devices_screen/cubit/states.dart';
import '../../../../order/order_sceen/widget/availlable_appointments_widget/availlable_appointments_widget.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class AcceptWidget extends StatelessWidget {
  const AcceptWidget({super.key, required this.orderCostumer});
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
              ),
              onPressed: () {
                // print('${orderCostumer.id}6666666666666666666666666666');
                cubit.availableAppointment = null;
                cubit.selectedColor = Colors.white;
                cubit.selectedTextColor = Colors.black;
                cubit.selectedId = null;
                cubit.getAvailableAppointments(
                  token: token.toString(),
                  companyId: orderCostumer.appointment!.compane!.id!.toInt(),
                );
                cubitAppointment.getAppointmentById(
                    token: token.toString(),
                    idAppointment: orderCostumer.appointment!.id);

                showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Choose when to start the installation',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content:
                            const AvailableAppointmentsWidget(isAccept: true),
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
                              if (cubit.availableAppointment != null) {
                                cubit.orderStatus(
                                    token: token.toString(),
                                    idOrder: orderCostumer.id!.toInt(),
                                    status: "Accepted");
                                cubit.updateDetectionAppointment(
                                  token: token.toString(),
                                  idOrder: orderCostumer.id!.toInt(),
                                  teamId: cubitAppointment
                                      .appointmentDetails!.data!.team!.id!
                                      .toInt(),
                                  startTime:
                                      cubit.availableAppointment.toString(),
                                );

                                cubitAppointment.getAllCustomerOrders(
                                    token: token.toString());

                                Navigator.of(context).pop();
                              } else {
                                print(orderCostumer.id);
                              }
                            },
                          ),
                        ],
                      );
                    });
              },
              child: const Text('Accept'),
            );
          },
        );
      },
    );
  }
}
