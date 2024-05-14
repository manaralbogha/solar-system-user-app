import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';
import 'package:solar_system/modules/order/suggested_product_for_company_screen/suggested_general_product_widget/suggested_general_product_widget.dart';

import '../../../models/model_appointment_orders_screen.dart';
import '../../../models/model_get_all_company.dart';
import '../../../shared/const/const.dart';

class SuggestedProductForCompanyScreen extends StatelessWidget {
  const SuggestedProductForCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    AppointmentOrdersModel? orderDevices;
    DataCompany? company;

    if (arg!['company'] != null) {
      company = arg['company'];
      print(arg['company'].toString());
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
        // cubit.totalPrice=int.parse(cubit.inverter![cubit.indexInverter].price);
        // cubit.totalPrice = (int.parse(cubit.panel![cubit.indexPanel].price) *
        //         cubit.panel![cubit.indexPanel].quantity) +
        //     (int.parse(cubit.batter![cubit.indexBatter].price) *
        //         cubit.batter![cubit.indexBatter].quantity) +
        //     (int.parse(cubit.inverter![cubit.indexInverter].price) *
        //         cubit.inverter![cubit.indexInverter].quantity);
        return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  orderDevices == null
                      ? company!.name
                      : orderDevices.data!.appointment!.compane!.name
                          .toString(),
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! GetCategoryForProductIdLoadingState,
              builder: ((context) {
                return ConditionalBuilder(
                  condition: cubit.panel!.isEmpty &&
                      cubit.batter!.isEmpty &&
                      cubit.inverter!.isEmpty &&
                      cubit.generator!.isEmpty,
                  builder: (context) {
                    return const Center(child: Text('No Product'));
                  },
                  fallback: ((context) {
                    cubit.productsSelected = [];
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: Card(
                          //     elevation: 6,
                          //     child: Column(
                          //       children: [
                          //         AutoSizeText(
                          //           'Total Price',
                          //           style: TextStyle(
                          //             fontSize: 20,
                          //             overflow: TextOverflow.ellipsis,
                          //             fontWeight: FontWeight.w700,
                          //             color: Colors.indigo.shade300,
                          //           ),
                          //           minFontSize: 8,
                          //           maxLines: 1,
                          //         ),
                          //         AutoSizeText(
                          //           ' ${cubit.totalPrice} S.P',
                          //           style: TextStyle(
                          //             fontSize: 25,
                          //             overflow: TextOverflow.ellipsis,
                          //             fontWeight: FontWeight.w700,
                          //             color: Colors.indigo.shade300,
                          //           ),
                          //           minFontSize: 8,
                          //           maxLines: 1,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Card(
                          //   child: Text('${cubit.totalPrice}'),
                          // ),
                          if (cubit.panel!.isNotEmpty)
                            SuggestedGeneralProductWidget(
                              generalProduct: cubit.panel!,
                              indexPanel: cubit.indexPanel,
                              indexBatter: cubit.indexBatter,
                              indexInverter: cubit.indexInverter,
                              indexGenerator: cubit.indexGenerator,
                              productsSelected: cubit.productsSelected,
                            ),
                          if (cubit.batter!.isNotEmpty)
                            SuggestedGeneralProductWidget(
                              generalProduct: cubit.batter!,
                              indexPanel: cubit.indexPanel,
                              indexBatter: cubit.indexBatter,
                              indexInverter: cubit.indexInverter,
                              indexGenerator: cubit.indexGenerator,
                              productsSelected: cubit.productsSelected,
                            ),
                          if (cubit.inverter!.isNotEmpty)
                            SuggestedGeneralProductWidget(
                              generalProduct: cubit.inverter!,
                              indexPanel: cubit.indexPanel,
                              indexBatter: cubit.indexBatter,
                              indexInverter: cubit.indexInverter,
                              indexGenerator: cubit.indexGenerator,
                              productsSelected: cubit.productsSelected,
                            ),
                          if (cubit.generator!.isNotEmpty)
                            SuggestedGeneralProductWidget(
                              generalProduct: cubit.generator!,
                              indexPanel: cubit.indexPanel,
                              indexBatter: cubit.indexBatter,
                              indexInverter: cubit.indexInverter,
                              indexGenerator: cubit.indexGenerator,
                              productsSelected: cubit.productsSelected,
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (company != null) {
                                    cubit.availableAppointment = null;
                                    cubit.selectedId = null;
                                    cubit.selectedColor = Colors.white;
                                    cubit.selectedTextColor = Colors.black;
                                    cubit.getAvailableAppointments(
                                        token: token.toString(),
                                        companyId: company.id);
                                    Navigator.pushNamed(context, '/OrderScreen',
                                        arguments: {'company': company});
                                  }
                                  if (orderDevices != null) {
                                    Navigator.pushNamed(context, '/OrderScreen',
                                        arguments: {
                                          'company': company,
                                          'orderDevices': orderDevices,
                                        });
                                  }
                                  cubit
                                      .addProductsToMap(cubit.productsSelected);
                                  print(cubit.productsSelected.toString());
                                },
                                child: const Text('Next'),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                );
              }),
              fallback: ((context) {
                return const Center(child: CircularProgressIndicator());
              }),
            ));
      },
    );
  }
}
