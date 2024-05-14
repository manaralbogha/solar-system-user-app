import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/suggested_details_solar_system_screen/widget/stack_widget.dart';

import '../../../models/model_suggested_solar_system.dart';
import '../../../shared/components/row_text_text_widget.dart';
import '../../../shared/const/const.dart';
import '../devices_screen/cubit/cubit.dart';
import '../devices_screen/cubit/states.dart';

class SuggestedDetailsSolarSystemScreen extends StatelessWidget {
  const SuggestedDetailsSolarSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    SuggestedSolarSystemModel suggestedSolarSystemModel;
    int indexInverter;
    suggestedSolarSystemModel = arg!['suggestedSolarSystemModel'];
    indexInverter = arg['index'];
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);
        cubit.totalPrice = (int.parse(suggestedSolarSystemModel
                    .panels![indexInverter].price
                    .toString()) *
                suggestedSolarSystemModel.panels![indexInverter].panelAmount!
                    .toInt()) +
            (int.parse(suggestedSolarSystemModel.batteries![indexInverter].price
                    .toString()) *
                suggestedSolarSystemModel
                    .batteries![indexInverter].batteryAmount!
                    .toInt()) +
            int.parse(suggestedSolarSystemModel.inverters![indexInverter].price
                .toString());
        cubit.hoursOnBattery =
            24 - (int.parse(cubit.sunAvgHoursController.text));
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 6,
                      child: Column(
                        children: [
                          AutoSizeText(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700,
                              color: Colors.indigo.shade300,
                            ),
                            minFontSize: 8,
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            ' ${cubit.totalPrice} S.P',
                            style: TextStyle(
                              fontSize: 25,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700,
                              color: Colors.indigo.shade300,
                            ),
                            minFontSize: 8,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  StackWidget(
                      indexInverter: indexInverter,
                      panels: suggestedSolarSystemModel.panels),
                  StackWidget(
                      indexInverter: indexInverter,
                      batteries: suggestedSolarSystemModel.batteries),
                  StackWidget(
                      indexInverter: indexInverter,
                      inverters: suggestedSolarSystemModel.inverters),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.availableAppointment = null;
                        cubit.selectedId = null;
                        cubit.selectedColor = Colors.white;
                        cubit.selectedTextColor = Colors.black;
                        cubit.lat = null;
                        cubit.long = null;
                        cubit.getAvailableAppointments(
                          token: token.toString(),
                          companyId: suggestedSolarSystemModel
                              .inverters![indexInverter].company![0].id!
                              .toInt(),
                        );
                        Navigator.pushNamed(context, '/OrderScreen',
                            arguments: {
                              'suggestedSolarSystemModel':
                                  suggestedSolarSystemModel,
                              'index': indexInverter,
                            }
                            // arguments: {'company': company}
                            );
                        cubit.addProductsSuggestedToMap(
                            suggestedSolarSystemModel, indexInverter);

                        print(cubit.productsSelected.toString());
                      },
                      child: const Text(
                        'NEXT',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
