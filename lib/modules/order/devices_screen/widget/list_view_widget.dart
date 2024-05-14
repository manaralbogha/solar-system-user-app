import 'package:flutter/material.dart';
import 'package:solar_system/modules/order/devices_screen/widget/card_devices_widget.dart';

import '../../../../models/model_appointment_orders_screen.dart';
import '../../../../models/model_devices_screen.dart';

class ListViewWidget extends StatelessWidget {
  final DevicesScreenModel? devices;
  final List<Data1> deviceCheck;
  final AppointmentOrdersModel? orderDevices;

  const ListViewWidget(
      {super.key,
      required this.devices,
      required this.deviceCheck,
      this.orderDevices});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CardDevicesWidget(
                  devices: devices!.data!.data![index],
                  //isChecked: isChecked![index],
                  index: index,
                  orderDevices: orderDevices,
                );
              },
              itemCount: devices!.data!.data!.length,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (deviceCheck.isNotEmpty) {
              Navigator.pushNamed(
                context,
                '/SelectedDevicesScreen',
                arguments: {
                  'deviceCheck': deviceCheck,
                  'orderDevices': orderDevices,
                },
              );
            } else {
              const snackBar = SnackBar(
                content: Text("You must select at least one device",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.red)),
                backgroundColor: Colors.white,
                behavior: SnackBarBehavior.floating,
                showCloseIcon: true,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: const Text('NEXT'),
        ),
      ],
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