import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/cubit.dart';
import '../../../../cubit/states.dart';

class FeedBackWidget extends StatelessWidget {
  const FeedBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyScreenCubit, CompanyScreenStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CompanyScreenCubit.get(context);
        return ConditionalBuilder(
          condition: state is! GetFeedBackByCompanyIdLoadingState,
          builder: (context) {
            if (cubit.getAllByCompanyId!.data!.isNotEmpty) {
              return Expanded(
                child: ListView.builder(
                  itemCount: cubit.getAllByCompanyId!.data!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cubit
                                    .getAllByCompanyId!.data![index].user!.name
                                    .toString()),
                                const Divider(
                                  thickness: 2,
                                  // indent: 80,
                                  endIndent: 200,
                                ),
                                Text(
                                  cubit.getAllByCompanyId!.data![index].title
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(cubit
                                    .getAllByCompanyId!.data![index].message
                                    .toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return Column(
              children: const [
                SizedBox(
                  height: 150,
                ),
                Center(child: Text('No FeedBak Yat.')),
              ],
            );
          },
          fallback: (context) {
            return Column(
              children: const [
                SizedBox(
                  height: 150,
                ),
                Center(child: CircularProgressIndicator()),
              ],
            );
          },
        );
      },
    );
  }
}
