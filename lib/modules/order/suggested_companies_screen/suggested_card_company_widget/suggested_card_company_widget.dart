import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';

import '../../../../../../models/model_get_all_company.dart';
import '../../../../../../shared/components/row_text_text_widget.dart';
import '../../../../../../shared/const/const.dart';
import '../../../../models/model_suggested_solar_system.dart';

class SuggestedCardCompanyWidget extends StatelessWidget {
  const SuggestedCardCompanyWidget(
      {super.key, required this.suggestedSolarSystemModel});
  //final DataCompany? company;
  final SuggestedSolarSystemModel suggestedSolarSystemModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);
        return InkWell(
          onTap: () {
            // cubit.panel = [];
            // cubit.batter = [];
            // cubit.inverter = [];
            // cubit.generator = [];
            // cubit.indexPanel = 0;
            // cubit.indexBatter = 0;
            // cubit.indexInverter = 0;
            // cubit.indexGenerator = 0;
            // cubit.getProductsForCompanyId(
            //     idCompany: company!.id, token: token.toString());

            // Navigator.pushNamed(context, '/SuggestedProductForCompanyScreen',
            //     arguments: {
            //       'company': company,
            //       });
            Navigator.pushNamed(context, '/SuggestedSolarSystemsForOneCompany',
                arguments: {
                  'suggestedSolarSystemModel': suggestedSolarSystemModel,
                });
          },
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(suggestedSolarSystemModel
                        .batteries![0].company![0].name
                        .toString()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Image.network(
                      endPointImage +
                          suggestedSolarSystemModel
                              .batteries![0].company![0].logo
                              .toString(),
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // RowTextText(
                  //   sized1: 60,
                  //   name: 'Phone : ',
                  //   number: company!.phone,
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: RowTextText(
                  //     sized1: 60,
                  //     name: 'Emil : ',
                  //     number: company!.email,
                  //   ),
                  // ),
                  const Spacer(),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        5,
                        (index) {
                          return Icon(
                            index <
                                    suggestedSolarSystemModel
                                        .batteries![0].company![0].rate!
                                        .toInt()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.yellow[700],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
