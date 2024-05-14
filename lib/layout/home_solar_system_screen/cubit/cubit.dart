import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/layout/home_solar_system_screen/cubit/states.dart';
import 'package:solar_system/modules/companies_screen/companies_screen.dart';

import '../../../modules/appointment/appointment_screen/appointment_screen.dart';
import '../../../modules/home_screen/home_screen.dart';
import '../../../shared/const/const.dart';
import '../../../shared/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  int page = 0;

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  List<Widget> items = [
    const Icon(
      Icons.home_outlined,
      size: 30,
    ),
    const Icon(Icons.corporate_fare_outlined, size: 30),
    const Icon(
      Icons.access_time_sharp,
      size: 30,
    )
  ];

  List<Widget> screens = [
    HomeScreen(),
    const CompaniesScreen(),
    const AppointmentScreen()
  ];

  void changeBottomNavBar(int index) {
    page = index;
    emit(ChangeBottomNavBarState());
  }

  void changePass(
      {required String token,
      required String pass,
      required String newPass,
      required String confNewPass}) {
    emit(ChangePassLoadingState());

    DioHelper.putData(
        url: '$endPoint/user/changepassword',
        token: token,
        data: {
          'oldpassword': pass,
          'newpassword': newPass,
          'newpassword_confirmation': confNewPass,
        }).then((value) {
      print(value.data);

      emit(ChangePassSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ChangePassErrorsState());
    });
  }
}
