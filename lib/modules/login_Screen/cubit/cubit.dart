import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/models/model_login_screen.dart';
import 'package:solar_system/modules/login_Screen/cubit/states.dart';
import 'package:solar_system/shared/const/const.dart';
import 'package:solar_system/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  void changePasswordStatus() {
    if (obscureText == true) {
      obscureText = false;
    } else {
      obscureText = true;
    }
    emit(ChangeIconSifForPasswordState());
  }

  late LoginScreenModel login;
  Map<String, dynamic>? loginError;
  void userLogIn({
    required String email,
    required String password,
  }) {
    DioHelper.postData(url: "$endPoint/login", data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      login = LoginScreenModel.fromJson(value.data);
      // print(login.data!.token!.token);
      emit(LoginSuccessState(login));
    }).catchError((onError) {
      // final body = json.decode(onError.data.toString());
      print(onError.toString());
      // loginError = json.decode(onError);
      // print('000000000000000');
      //print(body!['success']);
      // print('1111111111111111111');
      emit(LoginErrorState(onError.toString()));
    });
  }
}
