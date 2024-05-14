
import 'package:flutter/material.dart';

import 'package:solar_system/models/model_devices_screen.dart';

import '../../../models/model_appointment_orders_screen.dart';
import 'widget/list_view_selected_devices_widget.dart';

class SelectedDevicesScreen extends StatelessWidget {
  const SelectedDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    AppointmentOrdersModel? orderDevices;

    if (arg!['orderDevices'] != null) {
      orderDevices = arg['orderDevices'];
    }
    final List<Data1> deviceCheck = arg['deviceCheck'];
    return Scaffold(
        appBar: AppBar(),
        body: ListViewSelectedDevicesWidget(
          deviceCheck: deviceCheck,
          orderDevices: orderDevices,
        ));
  }
}
