import 'package:flutter/material.dart';

import '../../../../models/model_suggested_solar_system.dart';
import '../suggested_card_company_widget/suggested_card_company_widget.dart';

class SuggestedGridViewCompanyWidget extends StatelessWidget {
  //final List<DataCompany>? companies;
  final List<SuggestedSolarSystemModel> suggestedSolarSystemModel;
  const SuggestedGridViewCompanyWidget(
      {super.key, required this.suggestedSolarSystemModel});

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
      itemCount: suggestedSolarSystemModel.length,
      itemBuilder: ((context, index) {
        if (suggestedSolarSystemModel[index].inverters!.isNotEmpty) {
          return SuggestedCardCompanyWidget(
              suggestedSolarSystemModel: suggestedSolarSystemModel[index]);
        }
      }),
    );
  }
}
