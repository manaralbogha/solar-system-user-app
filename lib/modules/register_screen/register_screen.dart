import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';

import 'package:solar_system/modules/register_screen/cubit/cubit.dart';
import 'package:solar_system/modules/register_screen/cubit/states.dart';
import 'package:solar_system/shared/components/row_text_button_widget.dart';

import 'package:solar_system/shared/components/text_form_filed_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Center(
        child: Text(
          "SOLAR SYSTEM",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            //   Navigator.pushNamed(context, '/LoginScreen');
            Navigator.pushNamedAndRemoveUntil(
                context, '/LoginScreen', (Route<dynamic> route) => false);
            Fluttertoast.showToast(
                msg: ' ${state.register.message}',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 8,
                backgroundColor: Colors.green);
          }
          if (state is RegisterErrorState) {
            print(state.message);
            // print(state.error['message']);
            Fluttertoast.showToast(
                msg: ' ${state.message}',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 8,
                backgroundColor: Colors.red);
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.4,
                    // colorFilter: ColorFilter.mode(

                    //     Colors.white.withOpacity(0.5), BlendMode.dstATop),
                    // alignment: Alignment.topCenter,

                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/shutterstock_581537176.0.jpg',
                    ),
                  ),
                ),
                // height: (MediaQuery.of(context).size.height -
                //         appBar.preferredSize.height -
                //         MediaQuery.of(context).padding.top) *
                //     1,
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.03,
                      ),
                      buildTextFormFiled(
                        textType: TextInputType.text,
                        lableText: 'Name',
                        controller: cubit.nameController,
                        iconPri: const Icon(Icons.person),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name ';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.01,
                      ),
                      buildTextFormFiled(
                        textType: TextInputType.emailAddress,
                        lableText: 'Email',
                        controller: cubit.emailController,
                        iconPri: const Icon(Icons.email),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email ';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.01,
                      ),
                      buildTextFormFiled(
                        obscureText: cubit.obscureText,
                        textType: TextInputType.visiblePassword,
                        lableText: 'Password',
                        controller: cubit.passwordController,
                        iconPri: const Icon(Icons.password),
                        iconSuf: InkWell(
                          child: cubit.obscureText
                              ? const Icon(
                                  Icons.visibility,
                                )
                              : const Icon(Icons.visibility_off),
                          onTap: () {
                            cubit.changePasswordStatus();
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your  Password';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.01,
                      ),
                      buildTextFormFiled(
                        obscureText: cubit.obscureTextConfirmation,
                        textType: TextInputType.visiblePassword,
                        lableText: 'Password Confirmation',
                        controller: cubit.passwordConfirmationController,
                        iconPri: const Icon(Icons.password),
                        iconSuf: InkWell(
                          child: cubit.obscureTextConfirmation
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onTap: () {
                            cubit.changePasswordStatusConfirmation();
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your  Password Confirmation';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.01,
                      ),
                      buildTextFormFiled(
                        textType: TextInputType.phone,
                        lableText: 'Phone',
                        controller: cubit.phoneController,
                        iconPri: const Icon(Icons.phone),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your  Phone';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.1,
                      ),
                      BulidRow(
                        formKey: cubit.formKey,
                        text: cubit.selectedate == null
                            ? " No Date Chosen!"
                            : 'Picked Date :${DateFormat.yMd().format(cubit.selectedate!)}',
                        buttonText: 'birth',
                        onPressed: () {
                          cubit.presentDatePicker(context);
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.01,
                      ),
                      BulidRow(
                        formKey: cubit.formKey,
                        text: 'Choose location',
                        buttonText: 'location',
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/googleMap')
                                .then((dynamic value) {
                              cubit.lat = value['lat'];
                              cubit.long = value['long'];
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Please enter the information first',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 8,
                                backgroundColor: Colors.amber);
                          }
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.1,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          //enableFeedback: true,
                          // splashFactory: NoSplash.splashFactory,
                          // animationDuration: Duration(milliseconds: 100),

                          fixedSize:
                              MaterialStateProperty.all(const Size(0, 50)),
                          overlayColor: MaterialStateProperty.all(Colors.grey),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            if (cubit.selectedate != null) {
                              if (cubit.lat != null) {
                                cubit.userRegister(
                                  name: cubit.nameController.text,
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                  password_confirmation:
                                      cubit.passwordConfirmationController.text,
                                  date: cubit.date!,
                                  phone: cubit.phoneController.text,
                                  lat: cubit.lat.toString(),
                                  long: cubit.long.toString(),
                                );
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Select your location",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 8,
                                    backgroundColor: Colors.red);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Select your birthday",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 8,
                                  backgroundColor: Colors.red);
                            }
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 22,
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, '/LoginScreen');
                      //   },
                      //   child: Text(
                      //     'LOGIN NOW',
                      //     style: TextStyle(fontSize: 20),
                      //   ),
                      // ),
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
}
