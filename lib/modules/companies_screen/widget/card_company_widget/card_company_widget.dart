import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/model_get_all_company.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../../../shared/const/const.dart';

import '../../../order/devices_screen/cubit/cubit.dart';
import '../../../order/devices_screen/cubit/states.dart';
import '../../../order/order_sceen/widget/availlable_appointments_widget/availlable_appointments_widget.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../maintenance_appointment_widget/maintenance_appointment_widget.dart';
import '../see_feed_back_widget/see_feed_back_widget.dart';

class CardCompanyWidget extends StatelessWidget {
  const CardCompanyWidget({super.key, required this.company});
  final DataCompany company;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyScreenCubit, CompanyScreenStates>(
      listener: (context, state) {
        // if (state is MaintenanceAppointmentSuccessState) {
        //   const snackBar = SnackBar(
        //     content: Text('email not found',
        //         textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        //     backgroundColor: Colors.red,
        //   );
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // }
      },
      builder: (context, state) {
        var cubit = CompanyScreenCubit.get(context);
        return InkWell(
          onTap: () async {
            cubit.getProductForCompany(token: token.toString(), id: company.id);

            await Navigator.pushNamed(
              context,
              "/ShowProductForCompanyScreen",
              arguments: {'company': company},
            );

            //  print('object');
          },
          child: Card(
            // color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),

            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 85,
                        child: AutoSizeText(
                          company.name,
                          style: const TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            //  fontWeight: FontWeight.bold,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff964B00),
                          ),
                          minFontSize: 8,
                          maxLines: 2,
                        ),
                      ),
                      const Spacer(),
                      SeeFeedBackWidget(
                        companyId: company.id,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 130,
                    child: Center(
                      child: Image.network(
                        endPointImage + company.logo,
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.green.shade100,
                      border: Border.all(color: Colors.green, width: 1),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.green.withOpacity(0.5),
                      //     spreadRadius: 0.3,
                      //     blurRadius: 5,
                      //     // offset: Offset(0, 3), // changes position of shadow
                      //   ),
                      // ],
                    ),
                    padding: const EdgeInsets.all(6),
                    //  color: Colors.green.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowTextText(
                          sized1: 50,
                          name: 'Phone : ',
                          number: company.phone,
                        ),
                        RowTextText(
                          sized1: 50,
                          name: 'Emil : ',
                          number: company.email,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MaintenanceAppointment(companyId: company.id),
                  const Spacer(),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        5,
                        (index) {
                          return Icon(
                            index < company.rate
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
