import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';
import 'package:solar_system/modules/order/edit_device_information_screen/widget/number_picker_widget.dart';

import 'package:solar_system/shared/const/const.dart';
import '../../../../models/model_devices_screen.dart';
import '../../../shared/components/rowTextButtonTextButtonWidget.dart';

class EditDeviceInformationScreen extends StatelessWidget {
  const EditDeviceInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final List<Data1> deviceCheck = arg['deviceCheck'];
    final int index = arg['index'];

    //final int workHours = arg['workHours'];
    // final int count = arg['count'];

    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);
        //cubit.device = arg['devices'];
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text(deviceCheck[index].name)),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.grey.shade300,
                child: Column(
                  children: [
                    Image.network(
                      endPointImage + deviceCheck[index].image,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          NumberPickerWidget(
                            number: deviceCheck[index],
                            name: 'Voltage : ',
                          ),
                          NumberPickerWidget(
                            number: deviceCheck[index],
                            name: 'Voltage Power : ',
                          ),
                          // NumberPickerWidget(
                          //   number: deviceCheck[index],
                          //   name: 'fazes Number : ',
                          // ),
                          RowTextButtonTextButton(
                            name: 'Work Hours',
                            onPressedAdd: () {
                              cubit.addWorkHours(
                                deviceCheck[index],
                              );
                            },
                            countNum: deviceCheck[index].workHours.toString(),
                            onPressedRemove: () {
                              cubit.removeWorkHours(
                                deviceCheck[index],
                              );
                            },
                          ),
                          RowTextButtonTextButton(
                            name: 'Count',
                            onPressedAdd: () {
                              cubit.addCount(
                                deviceCheck[index],
                              );
                            },
                            countNum: deviceCheck[index].count.toString(),
                            onPressedRemove: () {
                              cubit.removeCount(
                                deviceCheck[index],
                              );
                            },
                          ),

                          ElevatedButton(
                              onPressed: () {
                                cubit.dailyLoadCalculationForEachDevice(
                                    deviceCheck[index]);
                                cubit.editSumTotalWatt(deviceCheck[index]);
                                cubit.dailyLoadOnPowerCalculationForEachDevice(
                                    deviceCheck[index]);
                                cubit.editSumTotalWattOnPower(
                                    deviceCheck[index]);
                                cubit
                                    .dailyLoadInverterWattCalculationForEachDevice(
                                        deviceCheck[index]);
                                cubit.editSumTotalInverterWatt(
                                    deviceCheck[index]);

                                Navigator.popAndPushNamed(
                                  context,
                                  '/SelectedDevicesScreen',
                                  arguments: {
                                    'deviceCheck': deviceCheck,
                                  },

                                  // ModalRoute.withName('/DevicesScreen'),
                                );
                              },
                              child: const Text('save edit')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
