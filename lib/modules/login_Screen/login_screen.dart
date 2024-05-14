import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solar_system/modules/login_Screen/cubit/cubit.dart';
import 'package:solar_system/modules/login_Screen/cubit/states.dart';
import 'package:solar_system/shared/const/const.dart';

import '../../shared/components/text_form_filed_widget.dart';
import '../../shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
      create: ((BuildContext context) => LoginCubit()),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            CacheHelper.saveData(
                key: 'token', value: state.login.data!.token!.token);
            CacheHelper.saveData(
                key: "name", value: state.login.data!.user!.name);
            CacheHelper.saveData(
                key: "email", value: state.login.data!.user!.email);
            CacheHelper.saveData(
                key: 'phone', value: state.login.data!.user!.phone);
            CacheHelper.saveData(
                key: 'dob', value: state.login.data!.user!.dOB);
            token = CacheHelper.getData(key: 'token');

            print(CacheHelper.getData(key: 'token'));
            print(CacheHelper.getData(key: 'name'));
            // print(CacheHelper.getData(key: "token"));
            print(CacheHelper.getData(key: 'email'));
            print(token);

            Navigator.pushNamedAndRemoveUntil(context, '/HomeSolarSystemScreen',
                (Route<dynamic> route) => false);
            Fluttertoast.showToast(
                msg: ' ${state.login.message}',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 8,
                backgroundColor: Colors.green);
          }
          // if (state is LoginErrorState) {
          //   print(state.error['success']);
          // }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: appBar,
            body: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
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
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.01,
                      ),
                      const Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.08,
                      ),
                      buildTextFormFiled(
                        controller: cubit.emailController,
                        iconPri: const Icon(Icons.email),
                        lableText: ('Email'),
                        textType: TextInputType.emailAddress,
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
                        lableText: ('Password'),
                        controller: cubit.passwordController,
                        iconPri: const Icon(Icons.password),
                        iconSuf: InkWell(
                          child: cubit.obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onTap: () {
                            cubit.changePasswordStatus();
                          },
                        ),
                        textType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.470,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          //enableFeedback: true,
                          // splashFactory: NoSplash.splashFactory,
                          // animationDuration: Duration(milliseconds: 100),
                          // fixedSize: MaterialStateProperty.all(
                          //   const Size(double.infinity, 50)),
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 50)),
                          overlayColor:
                              MaterialStateProperty.all(Colors.lightGreen),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.userLogIn(
                                email: cubit.emailController.text,
                                password: cubit.passwordController.text);
                          }
                        },
                        child: const Text(
                          'LogIn',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.022,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/RegisterScreen');
                        },
                        child: const Text(
                          'NEW ACCOUNT ?',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
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
