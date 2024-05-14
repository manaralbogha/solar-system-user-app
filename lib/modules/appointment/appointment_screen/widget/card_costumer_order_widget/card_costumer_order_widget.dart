import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solar_system/modules/appointment/appointment_screen/cubit/states.dart';

import 'package:solar_system/shared/const/const.dart';

import '../../../../../models/model_appointment_screen.dart';
import '../../../../../shared/components/row_text_text_widget.dart';

import '../../cubit/cubit.dart';
import '../accept_widget/accept_widget.dart';
import '../add_feed_back_widget/add_feed_back_widget.dart';
import '../add_rating_widget/add_rating_widget.dart';
import '../container_details_team_widget/container_details_team_widget.dart';
import '../reject_widget/reject_widget.dart';

class CardCostumerOrderWidget extends StatelessWidget {
  const CardCostumerOrderWidget(
      {super.key,
      required this.orderCostumer,
      required this.costumerOrders,
      required this.userId});
  final Order orderCostumer;
  final List<Order> costumerOrders;
  final int userId;

  @override
  Widget build(BuildContext context) {
    var cubit = AppointmentCubit.get(context);

    return BlocConsumer<AppointmentCubit, AppointmentStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(4.0),
          child: Card(
            // color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: orderCostumer.appointment!.status == 'done'
                    ? Colors.green
                    : orderCostumer.appointment!.status == 'pending'
                        ? Colors.orange
                        : orderCostumer.appointment!.status == 'accepted'
                            ? Colors.green
                            : Colors.red,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "${orderCostumer.appointment!.compane!.name}",
                            style: TextStyle(
                                color: orderCostumer.appointment!.status ==
                                        'done'
                                    ? Colors.green
                                    : orderCostumer.appointment!.status ==
                                            'pending'
                                        ? Colors.orange
                                        : orderCostumer.appointment!.status ==
                                                'accepted'
                                            ? Colors.green
                                            : Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        // if (orderCostumer.appointment!.status == 'done')
                        //   AddRatingWidget(
                        //     companyId:
                        //         orderCostumer.appointment!.compane!.id!.toInt(),
                        //     userId: userId,
                        //   ),
                        if (orderCostumer.appointment!.status == 'done')
                          AddFeedBackWidget(
                              companyId: orderCostumer.appointment!.compane!.id!
                                  .toInt()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: Colors.green.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${orderCostumer.appointment!.type}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: orderCostumer.appointment!.status == 'done'
                                ? Colors.green.shade50
                                : orderCostumer.appointment!.status == 'pending'
                                    ? Colors.orange.shade50
                                    : orderCostumer.appointment!.status ==
                                            'accepted'
                                        ? Colors.green.shade50
                                        : Colors.red.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${orderCostumer.appointment!.status}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: orderCostumer.appointment!.status ==
                                        'done'
                                    ? Colors.green
                                    : orderCostumer.appointment!.status ==
                                            'pending'
                                        ? Colors.orange
                                        : orderCostumer.appointment!.status ==
                                                'accepted'
                                            ? Colors.green
                                            : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  (orderCostumer.appointment) != null
                      ? RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.indigo.shade300),
                            children: <TextSpan>[
                              // const TextSpan(
                              //     text: 'The Date Of Execution Of The Order\n'),
                              const TextSpan(
                                text: "Data :  ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),

                              TextSpan(
                                text: orderCostumer.appointment!.startTime ==
                                        '0001-01-01'
                                    ? '-  -  -  -  -'
                                    : ' ${orderCostumer.appointment!.startTime}',
                                style: const TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              const TextSpan(text: '     '),

                              TextSpan(
                                text: orderCostumer.appointment!.startTime ==
                                        '0001-01-01'
                                    ? '-  -  -  -  -'
                                    : ' ${orderCostumer.appointment!.finishTime}',
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Text('no data'),
                  const SizedBox(
                    height: 10,
                  ),
                  if (orderCostumer.showDetails == true)
                    ConditionalBuilder(
                      condition: state is! GetAppointmentByIdLoadingState,
                      builder: ((context) {
                        if (cubit.appointmentDetails != null) {
                          return ContainerDetailsTeamWidget(
                            orderCostumer: orderCostumer,
                            detailsTeam: cubit.appointmentDetails!.data!.team,
                            x: cubit.appointmentDetails,
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                      fallback: ((context) {
                        return const Text('No data');
                      }),
                    ),
                  if (orderCostumer.showDetails == true)
                    const SizedBox(
                      height: 10,
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${orderCostumer.totalPrice} SP.",
                        style: TextStyle(
                          fontSize:
                              (orderCostumer.totalPrice)! < 9999999 ? 30 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  (MediaQuery.of(context).size.width - 235),
                                  40),
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xff964B00),
                              side: BorderSide(
                                color: orderCostumer.appointment!.status ==
                                        'done'
                                    ? Colors.green
                                    : orderCostumer.appointment!.status ==
                                            'pending'
                                        ? Colors.orange
                                        : orderCostumer.appointment!.status ==
                                                'accepted'
                                            ? Colors.green
                                            : Colors.red,
                                width: 1,
                              ),
                            ),
                            onPressed: () {
                              if (orderCostumer.showDetails == false) {
                                cubit.appointmentDetails = null;
                                cubit.getAppointmentById(
                                    token: token.toString(),
                                    idAppointment:
                                        orderCostumer.appointment!.id);

                                for (var element in costumerOrders) {
                                  element.showDetails = false;
                                }
                                orderCostumer.showDetails = true;
                              } else {
                                orderCostumer.showDetails = false;
                              }
                              cubit.showDetails();
                              print(orderCostumer.showDetails);
                            },
                            child: orderCostumer.showDetails == false
                                ? const Text('MORE')
                                : const Text('LESS'),
                          ),
                          if (orderCostumer.appointment!.type != 'maintenance')
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    (MediaQuery.of(context).size.width - 235),
                                    40),
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xff964B00),
                                side: BorderSide(
                                  color: orderCostumer.appointment!.status ==
                                          'done'
                                      ? Colors.green
                                      : orderCostumer.appointment!.status ==
                                              'pending'
                                          ? Colors.orange
                                          : orderCostumer.appointment!.status ==
                                                  'accepted'
                                              ? Colors.green
                                              : Colors.red,
                                  width: 1,
                                ),
                              ),
                              onPressed: () {
                                cubit.getOrderById(
                                    idOrder: orderCostumer.id,
                                    token: token.toString());
                                Navigator.pushNamed(
                                    context, "/ViewTheAppointmentOrders");
                              },
                              child: const Text('OPEN'),
                            ),
                        ],
                      ),
                    ],
                  ),
                  if (orderCostumer.appointment!.type == 'installation' &&
                      orderCostumer.appointment!.status == 'pending')
                    Row(
                      children: [
                        RejectWidget(orderCostumer: orderCostumer),
                        const Spacer(),
                        AcceptWidget(orderCostumer: orderCostumer),
                      ],
                    ),
                  if (orderCostumer.appointment!.type == 'detection')
                    Builder(builder: (context) {
                      if (orderCostumer.appointment!.type == 'detection') {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size((MediaQuery.of(context).size.width), 40),
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            cubit.deleteOrder(
                                id: orderCostumer.id, token: token.toString());
                            Fluttertoast.showToast(
                                msg: ' Appointment Deleted',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 8,
                                backgroundColor: Colors.green);
                            cubit.orderDeleted();
                          },
                          child: const Text('DELETE'),
                        );
                      }
                      return const SizedBox();
                      // const Center(
                      //     child: CircularProgressIndicator(
                      //   color: Colors.red,
                      // ));
                    }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
