import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solar_system/layout/home_solar_system_screen/cubit/cubit.dart';
import 'package:solar_system/layout/home_solar_system_screen/cubit/states.dart';

import '../../../../shared/components/text_form_filed_widget.dart';
import '../../../../shared/const/const.dart';

class DialogChangePassword extends StatelessWidget {
  const DialogChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        final passController = TextEditingController();
        final newPassController = TextEditingController();
        final confNewPassController = TextEditingController();
        final formKey = GlobalKey<FormState>();

        return Container(
          padding: EdgeInsets.all(8),
          height: 70,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              //  foregroundColor: Color.fromARGB(255, 102, 187, 106),
            ),
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    //   backgroundColor: Colors.green.shade200,
                    title: const Text(
                      'Change Your Password',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildTextFormFiled(
                              lableText: ('Password'),
                              controller: passController,
                              iconPri: const Icon(Icons.password),
                              textType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            buildTextFormFiled(
                              lableText: ('New Password'),
                              controller: newPassController,
                              iconPri: const Icon(Icons.password),
                              textType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your new password';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            buildTextFormFiled(
                              lableText: ('New Password Confirmation'),
                              controller: confNewPassController,
                              iconPri: const Icon(Icons.password),
                              textType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your New Password Confirmation';
                                }
                                return null;
                              },
                            ),
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
                      TextButton(
                        child: const Text(
                          'Approve',
                          style: TextStyle(
                              color: Colors.brown, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            cubit.changePass(
                              token: token.toString(),
                              pass: passController.text,
                              newPass: newPassController.text,
                              confNewPass: confNewPassController.text,
                            );
                            Fluttertoast.showToast(
                                msg: 'Password has been changed',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 8,
                                backgroundColor: Colors.green);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text(
              "Change Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
