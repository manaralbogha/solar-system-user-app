import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/shared/components/row_text_text_widget.dart';

import '../../../../models/model_devices_screen.dart';
import '../../../../shared/const/const.dart';
import '../../devices_screen/cubit/cubit.dart';
import '../../devices_screen/cubit/states.dart';

class CardSelectedDevicesWidget extends StatelessWidget {
  final List<Data1> deviceCheck;
  final int index;
  const CardSelectedDevicesWidget(
      {super.key, required this.deviceCheck, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);
        return Card(
          elevation: 5,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    height: 145,
                    child: Image.network(
                      endPointImage + deviceCheck[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              deviceCheck[index].name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.oldWattPerDay =
                                  deviceCheck[index].wattPerDay;
                              cubit.oldTotalWattOnPower =
                                  deviceCheck[index].wattPerDayOnPower;
                              cubit.oldTotalInverterWatt =
                                  deviceCheck[index].inverterWatt;
                              print(cubit.oldWattPerDay);
                              Navigator.popAndPushNamed(
                                  context, '/EditDeviceInformationScreen',
                                  arguments: {
                                    'deviceCheck': deviceCheck,
                                    'index': index,

                                    //'workHours': cubit.workHours,
                                    //'count': cubit.count,
                                  });
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      RowTextText(
                          sized1: 100,
                          name: 'Voltage : ',
                          number: deviceCheck[index].voltage,
                          sized: 40),
                      RowTextText(
                          sized1: 100,
                          name: 'Voltage Power : ',
                          number: deviceCheck[index].voltagePower,
                          sized: 40),
                      RowTextText(
                          sized1: 100,
                          name: 'Fazes Number : ',
                          number: '${deviceCheck[index].fazesNumber}',
                          sized: 40),
                      RowTextText(
                          sized1: 100,
                          name: 'Work hours : ',
                          number: '${deviceCheck[index].workHours}',
                          sized: 40),
                      RowTextText(
                          sized1: 100,
                          name: 'Count : ',
                          number: '${deviceCheck[index].count}',
                          sized: 40),
                    ],
                  ),
                  const Spacer(),
                  // IconButton(
                  //   onPressed: () {
                  //     // cubit.deleteDevice(deviceCheck[index], deviceCheck);
                  //   },
                  //   icon: const Icon(
                  //     Icons.delete,
                  //     color: Colors.red,
                  //   ),
                  // ),
                ],
              ),
              // Text("${cubit.totalWatt}"),
              Card(
                elevation: 8,
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${deviceCheck[index].wattPerDay}',
                          style: TextStyle(fontSize: 20),
                        ),
                        // Text(
                        //   '${deviceCheck[index].wattPerDayOnPower}',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                        // Text(
                        //   '${deviceCheck[index].inverterWatt}',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
