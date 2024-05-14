import 'package:flutter/material.dart';

import '../../../../../models/model_appointment_screen.dart';

import '../card_costumer_order_widget/card_costumer_order_widget.dart';

class ListViewCostumerOrderWidget extends StatelessWidget {
  const ListViewCostumerOrderWidget({
    super.key,
    required this.ordersCostumer,
    required this.allCustomerAppointment,
  });
  final List<Order> ordersCostumer;
  final AppointmentModel? allCustomerAppointment;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ordersCostumer.length,
      itemBuilder: ((context, index) {
        return CardCostumerOrderWidget(
          orderCostumer: ordersCostumer[index],
          costumerOrders: ordersCostumer,
          userId: allCustomerAppointment!.data![0].id!.toInt(),
        );
      }),
    );
  }
}
