import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:solar_system/models/model_register_screen.dart';
import 'package:solar_system/modules/register_screen/cubit/states.dart';
import 'package:solar_system/shared/network/remote/dio_helper.dart';

import '../../../shared/const/const.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmationController = TextEditingController();

  final phoneController = TextEditingController();
  double? lat;
  double? long;
  DateTime? selectedate;
  String? date;

  bool obscureText = true;
  bool obscureTextConfirmation = true;

  void changePasswordStatus() {
    if (obscureText == true) {
      obscureText = false;
    } else {
      obscureText = true;
    }
    emit(ChangeIconSifForPasswordState());
  }

  void changePasswordStatusConfirmation() {
    if (obscureTextConfirmation == true) {
      obscureTextConfirmation = false;
    } else {
      obscureTextConfirmation = true;
    }
    emit(ChangeIconSifForPasswordConfirmationState());
  }

  void presentDatePicker(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      selectedate = DateTime.parse(DateFormat("yyyy-MM-dd").format(value));
      date = DateFormat("yyyy-MM-dd").format(value);

      emit(RegisterDateTimeState());
    });
  }

  late RegisterScreenModel register;

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String lat,
    required String long,
    String area = 'Damascus',
    required String date,
    required String password,
    required String password_confirmation,
  }) {
    DioHelper.postData(url: '$endPoint/register', data: {
      'name': name,
      'email': email,
      'phone': phone,
      'lat': lat,
      "long": long,
      'area': area,
      'DOB': date,
      'password': password,
      'password_confirmation': password_confirmation,
    }).then((value) {
      print('1111111111111111111111');
      register = RegisterScreenModel.fromJson(value.data);

      print(register.data!.user!.location!.lat);
      print(register.data!.user!.location!.long);
      print(value.data);
      emit(RegisterSuccessState(register));
      print(value.statusCode);
    }).catchError((error) {
      String? massage;
      if (error is DioError) {
        print(error.response);
        print(error.response!.data['message']);
        massage = error.response!.data['message'];
      } else {
        print('object');
      }
      print(massage);
      emit(RegisterErrorState(error.toString(), massage));

      // print(error.runtimeType);
    });
  }
}
