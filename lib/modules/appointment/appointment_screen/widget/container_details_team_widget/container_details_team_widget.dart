import 'package:flutter/material.dart';

import '../../../../../models/model_appointment_details_by_id.dart';
import '../../../../../models/model_appointment_screen.dart';
import '../../../../../shared/components/row_text_text_widget.dart';

class ContainerDetailsTeamWidget extends StatelessWidget {
  const ContainerDetailsTeamWidget(
      {super.key,
      required this.orderCostumer,
      required this.detailsTeam,
      required this.x});
  final Order orderCostumer;
  final Team? detailsTeam;
  final AppointmentDetailsByIdModel? x;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (orderCostumer.showDetails == true) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: orderCostumer.appointment!.status == 'done'
                ? Colors.green.shade50
                : orderCostumer.appointment!.status == 'pending'
                    ? Colors.orange.shade50
                    : orderCostumer.appointment!.status == 'accepted'
                        ? Colors.green.shade50
                        : Colors.red.shade50,
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'TEAM DETAILS',
                style: TextStyle(
                    color: Color(0xff964B00),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(
                thickness: 2,
                endIndent: 50,
                indent: 50,
              ),
              RowTextText(
                  sized1: 50, name: 'Name : ', number: "${detailsTeam!.name}"),
              RowTextText(
                  sized1: 50,
                  name: 'phone : ',
                  number: "${detailsTeam!.phone}"),

              // RowTextText(name: 'phone Team : ', number: "${orderCostumer.id}")
            ],
          ),
        );
      }
      return const SizedBox();
    });
  }
}
