import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/components/text_form_filed_widget.dart';
import '../../../../../shared/const/const.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../rating_widget/rating_widget.dart';

class AddFeedBackWidget extends StatelessWidget {
  const AddFeedBackWidget({super.key, required this.companyId});
  final int companyId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppointmentCubit.get(context);
        return TextButton(
          style:
              ElevatedButton.styleFrom(foregroundColor: Colors.grey.shade700),
          onPressed: () {
            cubit.rat = 0;
            cubit.titleController.text = '';
            cubit.messageController.text = '';
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    title: const Text(
                      'Add Your Feed Back',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Form(
                      key: cubit.formKey,
                      child: SingleChildScrollView(
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
                            buildTextFormFiled(
                              textType: TextInputType.text,
                              lableText: 'Title',
                              controller: cubit.titleController,
                              iconPri: const Icon(Icons.short_text_outlined),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the title';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            buildTextFormFiled(
                              textType: TextInputType.text,
                              lableText: 'Message',
                              controller: cubit.messageController,
                              iconPri: const Icon(Icons.message_outlined),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the Message';
                                }
                                return null;
                              },
                            ),
                            const Divider(
                              height: 30,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            RatingWidget(),
                          ],
                        ),
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
                      ConditionalBuilder(
                        condition: state is! CreateFeedbackLoadingState,
                        builder: (context) {
                          return TextButton(
                            child: const Text(
                              'Send',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.createFeedback(
                                  title: cubit.titleController.text,
                                  message: cubit.messageController.text,
                                  companyId: companyId,
                                  token: token.toString(),
                                );
                              }
                              if (cubit.rat != 0) {
                                cubit.addRating(
                                  rate: cubit.rat.toInt(),
                                  companyId: companyId,
                                  token: token.toString(),
                                );
                              }
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        fallback: (context) {
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      )
                    ],
                  );
                });
          },
          child: Column(
            children: const [
              Icon(Icons.rate_review_outlined),
              Text(
                'FeedBack',
                style: TextStyle(fontSize: 8),
              ),
            ],
          ),
        );
      },
    );
  }
}
