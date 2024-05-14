import 'package:flutter/material.dart';

import '../../../models/model_product_for_company.dart';

import '../card_products_for_company_widget/card_products_for_company_widget.dart';

class GridViewProductsForCompanyWidget extends StatelessWidget {
  const GridViewProductsForCompanyWidget({super.key, required this.products});
  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 300,
        childAspectRatio: 3 / 2,
        //crossAxisSpacing: 2,
        // mainAxisSpacing: 2,
        maxCrossAxisExtent: 350,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CardProductsForCompanyWidget(
          product: products[index],
        );
      },
    );
  }
}
