import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/shared/components/row_text_text_widget.dart';

import '../../../../models/model_appointment_orders_screen.dart';
import '../../../../models/model_devices_screen.dart';
import '../../../../shared/const/const.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class CardDevicesWidget extends StatelessWidget {
  const CardDevicesWidget(
      {Key? key,
      required this.devices,
      //required this.isChecked,
      required this.index,
      this.orderDevices})
      : super(key: key);

  final Data1 devices;
  final AppointmentOrdersModel? orderDevices;

  //bool? isChecked;
  final int index;

  @override
  Widget build(BuildContext context) {
    // if (orderDevices != null) {
    //   orderDevices!.data!.devices?.forEach(
    //     (element) {
    //       if (element.device!.id == devices.id) {
    //         devices.isChecked = !devices.isChecked;
    //         print(devices.isChecked);
    //       }
    //       element.device!.isChecked = false;
    //     },
    //   );
    // }
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);
        return Card(
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 110,
                height: 120,
                child: Image.network(
                  endPointImage + devices.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    devices.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RowTextText(
                      sized1: 100,
                      name: 'Voltage : ',
                      number: devices.voltage,
                      sized: 40),
                  RowTextText(
                      sized1: 100,
                      name: 'Voltage Power : ',
                      number: devices.voltagePower,
                      sized: 40),
                  RowTextText(
                      sized1: 100,
                      name: 'Fazes Number : ',
                      number: '${devices.fazesNumber}',
                      sized: 40),
                ],
              ),
              const Spacer(),
              // IconButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/EditDeviceInformationScreen',
              //         arguments: {
              //           'devices': devices,
              //         });
              //   },
              //   icon: const Icon(Icons.settings),
              // ),
              Checkbox(
                  value: devices.isChecked,
                  onChanged: (value) {
                    cubit.checkDevice(
                      value,
                      devices,
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
