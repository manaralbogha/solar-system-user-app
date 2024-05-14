import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';

import 'package:solar_system/modules/order/selected_devices/widget/card_selected_devices_widget.dart';

import '../../../../models/model_appointment_orders_screen.dart';
import '../../../../models/model_devices_screen.dart';
import '../../../../shared/components/text_form_filed_widget.dart';
import '../../../../shared/const/const.dart';
import 'drop_down_button_widget.dart';

class ListViewSelectedDevicesWidget extends StatelessWidget {
  final List<Data1> deviceCheck;
  final AppointmentOrdersModel? orderDevices;

  const ListViewSelectedDevicesWidget(
      {super.key, required this.deviceCheck, this.orderDevices});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);

        return Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return CardSelectedDevicesWidget(
                      deviceCheck: deviceCheck,
                      index: index,
                    );
                  },
                  itemCount: deviceCheck.length,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Total Watt : ',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            '${cubit.totalWatt}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Text(
                      //       'Total Watt On Power : ',
                      //       style: TextStyle(fontSize: 20),
                      //     ),
                      //     Text(
                      //       '${cubit.totalWattOnPower}',
                      //       style: const TextStyle(
                      //           fontSize: 20, fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Text(
                      //       'Total Inverter Watt : ',
                      //       style: TextStyle(fontSize: 20),
                      //     ),
                      //     Text(
                      //       '${cubit.totalInverterWatt}',
                      //       style: const TextStyle(
                      //           fontSize: 20, fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (orderDevices != null) {
                  cubit.panel = [];
                  cubit.batter = [];
                  cubit.inverter = [];
                  cubit.generator = [];
                  cubit.indexPanel = 0;
                  cubit.indexBatter = 0;
                  cubit.indexInverter = 0;
                  cubit.indexGenerator = 0;
                  cubit.getProductsForCompanyId(
                      idCompany:
                          orderDevices!.data!.appointment!.compane!.id!.toInt(),
                      token: token.toString());
                  cubit.addDevicesToMap(deviceCheck);
                  Navigator.pushNamed(
                      context, '/SuggestedProductForCompanyScreen',
                      arguments: {
                        'orderDevices': orderDevices,
                      });
                } else {
                  cubit.dayAutomationController.text = '';
                  cubit.sunAvgHoursController.text = '';
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "Please enter the necessary information to help choose the solar system that best meets your needs",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        content: Form(
                          key: cubit.formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Divider(
                                  thickness: 2,
                                  height: 30,
                                  endIndent: 30,
                                  indent: 30,
                                ),
                                buildTextFormFiled(
                                  textType: TextInputType.phone,
                                  lableText: 'Day Automation',
                                  controller: cubit.dayAutomationController,
                                  iconPri:
                                      const Icon(Icons.date_range_outlined),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your  Day Automation';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                buildTextFormFiled(
                                  textType: TextInputType.phone,
                                  lableText: 'Sun Hours',
                                  controller: cubit.sunAvgHoursController,
                                  iconPri: const Icon(Icons.wb_sunny),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Sun Hours';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const DropdownButtonWidget(mainten: false),
                              ],
                            ),
                          ),
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
                              'Next',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.calculateBatteryNumber(
                                  totalWhatt: cubit.totalWatt,
                                  dayAutomation: int.parse(
                                      cubit.dayAutomationController.text),
                                  area: cubit.syrianProvince,
                                  sunAvgHours: int.parse(
                                      cubit.sunAvgHoursController.text),
                                  inverterWatt: cubit.totalInverterWatt,
                                  token: token.toString(),
                                );
                                cubit.addDevicesToMap(deviceCheck);
                                Navigator.of(context).pop();
                                Navigator.pushNamed(
                                    context, '/SuggestedCompaniesScreen');
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // cubit.getAllCompany(token: token.toString());
                  // cubit.addDevicesToMap(deviceCheck);
                  // Navigator.pushNamed(context, '/SuggestedCompaniesScreen');
                }
              },
              child: orderDevices == null
                  ? const Text('NEXT')
                  : const Text('MODIFY'),
            ),
          ],
        );
      },
    );
  }
}















// GridView.builder(
//         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 2.5 / 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: devices!.data.length,
//         itemBuilder: (BuildContext ctx, index) {
//           return Card(
//             elevation: 5,
//             child: Column(
//               children: [
//                 //  Image(image: AssetImage("${devices!.data![index].image}"))

//                 Image.network(
//                   endPointImage + devices!.data[index].image,
//                   width: double.infinity,
//                   height: 50,
//                   // fit: BoxFit.cover,
//                   // height: 400,
//                 ),
//                 Text(devices!.data[index].name),
//                 Text(devices!.data[index].voltage),
//                 Text(devices!.data[index].voltagePower),
//                 Text('${devices!.data[index].fazesNumber}'),

//                 // Image(
//                 //   image: CachedNetworkImageProvider(
//                 //     '${devices!.data![index].image}',
//                 //   ),
//                 // )
//               ],
//             ),
//           );
//         },
//       ),