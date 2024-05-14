import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/const/const.dart';
import '../../../../companies_screen/cubit/cubit.dart';
import '../../../../companies_screen/cubit/states.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../rating_widget/rating_widget.dart';

class AddRatingWidget extends StatelessWidget {
  const AddRatingWidget({
    super.key,
    required this.companyId,
    required this.userId,
  });
  final int companyId;
  final int userId;
  @override
  Widget build(BuildContext context) {
    int? feedBackId;
    return BlocConsumer<AppointmentCubit, AppointmentStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppointmentCubit.get(context);
        return BlocConsumer<CompanyScreenCubit, CompanyScreenStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubitCompanyScreen = CompanyScreenCubit.get(context);

            return TextButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.grey.shade700),
              onPressed: () async {
                cubitCompanyScreen.getFeedBackByCompanyId(
                    companyId: companyId, token: token.toString());

                showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        title: const Text(
                          'Add Your Rating',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Divider(
                                height: 0,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Builder(
                                builder: (context) {
                                  if (cubitCompanyScreen
                                      .getAllByCompanyId!.data!.isNotEmpty) {
                                    for (var element in cubitCompanyScreen
                                        .getAllByCompanyId!.data!) {
                                      if (element.user!.id == userId &&
                                          element.rate != 0) {
                                        feedBackId = element.id;
                                        print(feedBackId);
                                      }
                                    }

                                    return const RatingWidget();
                                  }
                                  return const Text(
                                      'Pleas Add Your FeedBack First ..');
                                },
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Send',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              if (cubit.rat != 0) {
                                cubit.addRating(
                                  rate: cubit.rat.toInt(),
                                  companyId: feedBackId!.toInt(),
                                  token: token.toString(),
                                );
                              }
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Column(
                children: const [
                  Icon(Icons.star_border),
                  Text(
                    'Rating',
                    style: TextStyle(fontSize: 8),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
