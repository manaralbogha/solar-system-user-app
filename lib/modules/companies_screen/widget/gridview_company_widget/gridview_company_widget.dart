import 'package:flutter/material.dart';

import '../../../../models/model_get_all_company.dart';
import '../card_company_widget/card_company_widget.dart';

class GridViewCompanyWidget extends StatelessWidget {
  const GridViewCompanyWidget({super.key, required this.companies});
  final List<DataCompany> companies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 400,
        childAspectRatio: 3 / 2,
        //crossAxisSpacing: 2,
        // mainAxisSpacing: 2,
        maxCrossAxisExtent: 350,
      ),
      itemCount: companies.length,
      itemBuilder: ((context, index) {
        return CardCompanyWidget(company: companies[index]);
      }),
    );
  }
}
