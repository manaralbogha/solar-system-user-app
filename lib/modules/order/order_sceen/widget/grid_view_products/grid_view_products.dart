import 'package:flutter/material.dart';

import '../../../../../models/model_product_for_company.dart';
import '../../../../../models/model_suggested_solar_system.dart';
import '../card_widget/card_widget.dart';

class GridViewProductsWidget extends StatelessWidget {
  const GridViewProductsWidget(
      {super.key,
      this.productsSelected,
      this.suggestedSolarSystemModel,
      this.indexInverter});
  final List<Products>? productsSelected;
  final SuggestedSolarSystemModel? suggestedSolarSystemModel;
  final int? indexInverter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
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
      ),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      height: 450,
      child: Column(
        children: [
          const Text(
            'PRODUCTS',
            style: TextStyle(
                fontSize: 30,
                color: Color(0xff964B00), // Colors.green.shade600,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                maxCrossAxisExtent: 300,
              ),
              itemCount: suggestedSolarSystemModel == null
                  ? productsSelected!.length
                  : 3,
              itemBuilder: ((context, index) {
                return CardWidget(
                  image: suggestedSolarSystemModel == null
                      ? productsSelected![index].image
                      : index == 0
                          ? suggestedSolarSystemModel!
                              .panels![indexInverter!.toInt()].image
                              .toString()
                          : index == 1
                              ? suggestedSolarSystemModel!
                                  .batteries![indexInverter!.toInt()].image
                                  .toString()
                              : suggestedSolarSystemModel!
                                  .inverters![indexInverter!.toInt()].image
                                  .toString(),
                  count: suggestedSolarSystemModel == null
                      ? productsSelected![index].quantity.toString()
                      : index == 0
                          ? suggestedSolarSystemModel!
                              .panels![indexInverter!.toInt()].panelAmount
                              .toString()
                          : index == 1
                              ? suggestedSolarSystemModel!
                                  .batteries![indexInverter!.toInt()]
                                  .batteryAmount
                                  .toString()
                              : 1.toString(),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
