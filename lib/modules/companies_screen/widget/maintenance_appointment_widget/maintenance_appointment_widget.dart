import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/const/const.dart';
import '../../../order/devices_screen/cubit/cubit.dart';
import '../../../order/devices_screen/cubit/states.dart';
import '../../../order/order_sceen/widget/availlable_appointments_widget/availlable_appointments_widget.dart';
import '../../../order/selected_devices/widget/drop_down_button_widget.dart';

class MaintenanceAppointment extends StatelessWidget {
  const MaintenanceAppointment({super.key, required this.companyId});
  final int companyId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubitDevices = DevicesCubit.get(context);
        return TextButton(
          onPressed: () {
            // print('${orderCostumer.id}6666666666666666666666666666');
            cubitDevices.availableAppointment = null;
            cubitDevices.selectedColor = Colors.white;
            cubitDevices.selectedTextColor = Colors.black;
            cubitDevices.selectedId = null;
            cubitDevices.lat = null;
            cubitDevices.long = null;
            cubitDevices.getAvailableAppointments(
              token: token.toString(),
              companyId: companyId,
            );

            showDialog<void>(
                // barrierColor: Colors.white54,
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    title: const Text(
                      'Choose a maintenance date',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Divider(
                          height: 1,
                          thickness: 2,
                        ),
                        DropdownButtonWidget(
                            mainten: true, companyId: companyId),
                        const Divider(
                          height: 1,
                          thickness: 2,
                        ),
                        const SingleChildScrollView(
                          child: AvailableAppointmentsWidget(isAccept: true),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/googleMap')
                                .then((dynamic value) {
                              cubitDevices.lat = value['lat'];
                              cubitDevices.long = value['long'];
                              print(cubitDevices.lat);
                              print(cubitDevices.long);
                            });
                          },
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  'Select Location',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.location_on,
                                // size: 30,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 2,
                        ),
                      ],
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
                            print(companyId);
                            if (cubitDevices.availableAppointment != null &&
                                cubitDevices.lat != null &&
                                cubitDevices.long != null) {
                              cubitDevices.maintenanceAppointment(
                                startTime: cubitDevices.availableAppointment
                                    .toString(),
                                teamId: cubitDevices.selectedId!.toInt(),
                                companyId: companyId,
                                lat: cubitDevices.lat!.toDouble(),
                                long: cubitDevices.long!.toDouble(),
                                area: 'area',
                                token: token.toString(),
                              );
                              Navigator.of(context).pop();
                              const snackBar = SnackBar(
                                content: Text(
                                    'A maintenance appointment has been taken',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green)),
                                backgroundColor: Colors.white,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              const snackBar = SnackBar(
                                content: Text(
                                    'The time or location was not selected',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red)),
                                backgroundColor: Colors.white,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }),
                    ],
                  );
                });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                width: 85,
                child: Text(
                  'Maintenance Request',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Icon(
                Icons.add_circle_outline_rounded,
                // size: 30,
              ),
            ],
          ),
        );
      },
    );
  }
}
