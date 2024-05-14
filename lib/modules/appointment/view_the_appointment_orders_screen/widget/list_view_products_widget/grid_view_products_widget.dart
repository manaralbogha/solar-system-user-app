import 'package:flutter/material.dart';
import 'package:solar_system/models/model_appointment_orders_screen.dart';

import '../card_product_widget/card_product_widget.dart';

class GridViewProductWidget extends StatelessWidget {
  const GridViewProductWidget({super.key, required this.products});
  final List<Products>? products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  //crossAxisSpacing: 2,
                  // mainAxisSpacing: 2,
                  maxCrossAxisExtent: 200,
                ),
                itemCount: products!.length,
                itemBuilder: (context, indexProduct) {
                  return CardProductWidget(
                    product: products![indexProduct],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
