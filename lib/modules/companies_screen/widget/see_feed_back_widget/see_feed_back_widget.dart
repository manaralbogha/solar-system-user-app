import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/companies_screen/widget/see_feed_back_widget/widget/feed_back_widget/feed_back_widget.dart';

import '../../../../shared/const/const.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class SeeFeedBackWidget extends StatelessWidget {
  const SeeFeedBackWidget({super.key, required this.companyId});
  final int companyId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyScreenCubit, CompanyScreenStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CompanyScreenCubit.get(context);

        return TextButton(
          onPressed: () async {
            cubit.getFeedBackByCompanyId(
                companyId: companyId, token: token.toString());

            await showModalBottomSheet<void>(
                backgroundColor: Colors.blue.shade50,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return SafeArea(
                    child: Column(
                      children: const [
                        Text(
                          'FeedBack',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Divider(
                          thickness: 2,
                          indent: 80,
                          endIndent: 80,
                        ),
                        FeedBackWidget(),
                      ],
                    ),
                  );
                });
          },
          child: Column(
            children: const [
              Icon(Icons.rate_review_outlined),
              Text(
                'See FeedBack',
                style: TextStyle(fontSize: 8),
              ),
            ],
          ),
        );
      },
    );
  }
}
