import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';
import 'package:solar_system/modules/order/order_sceen/widget/availlable_appointments_widget/availlable_appointments_widget.dart';

import 'package:solar_system/modules/order/order_sceen/widget/grid_view_devices/grid_view_devices.dart';
import 'package:solar_system/modules/order/order_sceen/widget/grid_view_products/grid_view_products.dart';

import '../../../models/model_appointment_orders_screen.dart';
import '../../../models/model_get_all_company.dart';
import '../../../models/model_suggested_solar_system.dart';
import '../../../shared/const/const.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    SuggestedSolarSystemModel? suggestedSolarSystemModel;
    AppointmentOrdersModel? orderDevices;
    int? indexInverter;
    if (arg['suggestedSolarSystemModel'] != null) {
      suggestedSolarSystemModel = arg['suggestedSolarSystemModel'];
      indexInverter = arg['index'];
      print(arg['suggestedSolarSystemModel'].toString());
    } else if (arg['orderDevices'] != null) {
      orderDevices = arg['orderDevices'];

      print(arg['orderDevices'].toString());
    }
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);

        //  cubit.getAvailableAppointments(token: token, companyId: company.id);
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                orderDevices == null
                    ? suggestedSolarSystemModel!
                        .inverters![indexInverter!.toInt()].company![0].name
                        .toString()
                    : orderDevices.data!.appointment!.compane!.name.toString(),
              ),
            ),
          ),
          body: SingleChildScrollView(
            //  physics: const BouncingScrollPhysics(),

            child: Column(
              children: [
                if (suggestedSolarSystemModel != null)
                  GridViewProductsWidget(
                      suggestedSolarSystemModel: suggestedSolarSystemModel,
                      indexInverter: indexInverter),
                if (suggestedSolarSystemModel == null)
                  GridViewProductsWidget(
                      productsSelected: cubit.productsSelected),
                GridViewDevicesWidget(deviceCheck: cubit.deviceCheck),
                if (suggestedSolarSystemModel != null)
                  const AvailableAppointmentsWidget(isAccept: false),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/googleMap')
                            .then((dynamic value) {
                          cubit.lat = value['lat'];
                          cubit.long = value['long'];
                          print(cubit.lat);
                          print(cubit.long);
                        });
                      },
                      child: const Text('Select Location'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      key: key,
                      onPressed: () {
                        if (orderDevices == null) {
                          if (cubit.selectedId != null &&
                              cubit.availableAppointment != null &&
                              cubit.lat != null &&
                              cubit.long != null) {
                            cubit.createOrder(
                                token: token.toString(),
                                totalVoltage: cubit.totalWatt.toString(),
                                totalPrice: cubit.totalPrice.toString(),
                                hoursOnCharge: cubit.sunAvgHoursController.text,
                                hoursOnBattery: cubit.hoursOnBattery.toString(),
                                space: "10",
                                lat: cubit.lat,
                                long: cubit.long,
                                area: 'Damascus',
                                products: cubit.listProductsMap,
                                devices: cubit.listDeviceMap,
                                teamId: cubit.selectedId,
                                startTime: cubit.availableAppointment,
                                companyId: suggestedSolarSystemModel!
                                    .inverters![indexInverter!.toInt()]
                                    .company![0]
                                    .id!
                                    .toInt());
                            Fluttertoast.showToast(
                                msg: 'Order Created ',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 8,
                                backgroundColor: Colors.green);
                            Navigator.pushNamedAndRemoveUntil(
                              context, '/HomeSolarSystemScreen',
                              (route) => false,
                              // arguments: {
                              //   'page': 2,
                              // }
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg: cubit.availableAppointment == null
                                    ? 'Select Appointment '
                                    : 'Select Location',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 8,
                                backgroundColor: Colors.orange);
                          }
                        } else {
                          print('1111111111');
                          if (cubit.lat != null && cubit.long != null) {
                            cubit.updateOrder(
                              idOrder: orderDevices.data!.id!.toInt(),
                              token: token.toString(),
                              totalVoltage: cubit.totalWatt.toString(),
                              totalPrice:
                                  '15000000', // cubit.totalPrice.toString(),
                              hoursOnCharge: "10",
                              hoursOnBattery: "10",
                              space: "10",
                              lat: 100.100,
                              long: 100.100,
                              area: 'mmmmmmm',
                              products: cubit.listProductsMap,
                              devices: cubit.listDeviceMap,
                            );
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/HomeSolarSystemScreen',
                              (route) => false,
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Select Location',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 8,
                                backgroundColor: Colors.orange);
                          }
                        }
                      },
                      child: orderDevices == null
                          ? const Text('Order')
                          : const Text('Update Order'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
