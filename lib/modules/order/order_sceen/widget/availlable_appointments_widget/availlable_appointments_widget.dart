import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';

class AvailableAppointmentsWidget extends StatelessWidget {
  const AvailableAppointmentsWidget({super.key, required this.isAccept});
  final bool isAccept;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);
        return Container(
          margin: const EdgeInsets.all(8.0),

          decoration: isAccept == false
              ? BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(color: Colors.green, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 7,
                      // offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                )
              : const BoxDecoration(),
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          //height: 450,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isAccept == false
                  ? const Text(
                      'Available Appointments',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff964B00), // Colors.green.shade600,
                          fontWeight: FontWeight.bold),
                    )
                  : const SizedBox(),
              SingleChildScrollView(
                scrollDirection:
                    isAccept == false ? Axis.horizontal : Axis.vertical,
                child: isAccept == false
                    ? Row(
                        children: cubit.allAvailableAppointments != null &&
                                cubit.allAvailableAppointments!.data!.isNotEmpty
                            ? List.generate(
                                cubit.allAvailableAppointments!.data!.length,
                                (index) {
                                if (cubit.allAvailableAppointments!.data![index]
                                        .id ==
                                    cubit.selectedId) {
                                  cubit.selectedColor = Colors.green;
                                  cubit.selectedTextColor = Colors.green;
                                } else {
                                  cubit.selectedColor = Colors.white;
                                  cubit.selectedTextColor = Colors.black;
                                }
                                return InkWell(
                                  onTap: () {
                                    cubit.colorSelected(index);
                                    cubit.availableAppointment = cubit
                                        .allAvailableAppointments!
                                        .data![index]
                                        .time;

                                    print(cubit.availableAppointment);
                                    print(cubit.selectedId);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: const Color(0xff964B00),
                                          width: 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: cubit.selectedColor,
                                          spreadRadius: 0.5,
                                          blurRadius: 7,
                                          // offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    //height: 450,
                                    child: Text(
                                      "${cubit.allAvailableAppointments!.data![index].time}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: cubit.selectedTextColor,
                                      ),
                                    ),
                                  ),
                                );
                              })
                            : [
                                const Text('no data'),
                              ])
                    : Column(
                        children: cubit.allAvailableAppointments != null &&
                                cubit.allAvailableAppointments!.data!.isNotEmpty
                            ? List.generate(
                                cubit.allAvailableAppointments!.data!.length,
                                (index) {
                                if (cubit.allAvailableAppointments!.data![index]
                                        .id ==
                                    cubit.selectedId) {
                                  cubit.selectedColor = Colors.green;
                                  cubit.selectedTextColor = Colors.green;
                                } else {
                                  cubit.selectedColor = Colors.white;
                                  cubit.selectedTextColor = Colors.black;
                                }
                                return InkWell(
                                  onTap: () {
                                    cubit.colorSelected(index);
                                    cubit.availableAppointment = cubit
                                        .allAvailableAppointments!
                                        .data![index]
                                        .time;
                                    print(cubit.availableAppointment);
                                    print(cubit.selectedId);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: const Color(0xff964B00),
                                          width: 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: cubit.selectedColor,
                                          spreadRadius: 0.5,
                                          blurRadius: 7,
                                          // offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    //height: 450,
                                    child: Text(
                                      "${cubit.allAvailableAppointments!.data![index].time}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: cubit.selectedTextColor,
                                      ),
                                    ),
                                  ),
                                );
                              })
                            : [
                                const Center(
                                    child: CircularProgressIndicator()),
                              ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
