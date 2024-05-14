import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solar_system/modules/appointment/appointment_screen/cubit/states.dart';
import 'package:solar_system/shared/const/const.dart';
import 'package:solar_system/shared/network/remote/dio_helper.dart';

import '../../../../models/model_appointment_details_by_id.dart';
import '../../../../models/model_appointment_orders_screen.dart';
import '../../../../models/model_appointment_screen.dart';

class AppointmentCubit extends Cubit<AppointmentStates> {
  AppointmentCubit() : super(AppointmentInitialState());
  static AppointmentCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final messageController = TextEditingController();
  num rat = 0;

  AppointmentModel? allCustomerAppointment;
  void getAllCustomerOrders({required String token}) {
    emit(GetAllCustomerOrdersLoadingState());
    DioHelper.getData(
      url: '$endPoint/user/orders',
      token: token,
    ).then((value) {
      //print(value.data);
      allCustomerAppointment = AppointmentModel.fromJson(value.data);
      print(allCustomerAppointment!.data![0].name);
      print(allCustomerAppointment!.toJson());
      emit(GetAllCustomerOrdersSuccessState());
    }).catchError((error) {
      emit(GetAllCustomerOrdersErrorsState());
    });
  }

  AppointmentDetailsByIdModel? appointmentDetails;
  void getAppointmentById({
    required String token,
    required int? idAppointment,
  }) {
    emit(GetAppointmentByIdLoadingState());
    DioHelper.getData(
      url: '$endPoint/appointment/show/$idAppointment',
      token: token,
    ).then((value) {
      print(value.data);
      appointmentDetails = AppointmentDetailsByIdModel.fromJson(value.data);
      print(appointmentDetails!.data!.team!.name);
      emit(GetAppointmentByIdSuccessState());
    }).catchError((error) {
      emit(GetAppointmentByIdErrorsState());
    });
  }

  void showDetails() {
    emit(ShowDetailsState());
  }

  AppointmentOrdersModel? orderForAppointment;
  void getOrderById({required int? idOrder, required String token}) {
    emit(GetOrderByIdLoadingState());
    DioHelper.getData(url: '$endPoint/order/show/$idOrder', token: token)
        .then((value) {
      print(value.data);
      orderForAppointment = AppointmentOrdersModel.fromJson(value.data);
      print(orderForAppointment!.data!.products![0].product!.features![0].name);
      emit(GetOrderByIdSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetOrderByIdErrorsState());
    });
  }

  void deleteOrder({
    required int? id,
    required String token,
  }) {
    emit(DeleteOrderLoadingState());
    DioHelper.deleteData(url: '$endPoint/order/delete/$id', token: token)
        .then((value) {
      print(value.data);
      emit(DeleteOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteOrderErrorsState());
    });
  }

  void orderDeleted() {
    getAllCustomerOrders(token: token.toString());
    emit(OrderDeletedState());
  }

  void createFeedback(
      {required String title,
      required String message,
      required int companyId,
      required String token}) {
    emit(CreateFeedbackLoadingState());
    DioHelper.postData(
            url: '$endPoint/feedback/create',
            data: {'title': title, 'message': message, 'compane_id': companyId},
            token: token)
        .then((value) {
      print(value.data);
      emit(CreateFeedbackSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateFeedbackErrorsState());
    });
  }

  void addRating(
      {required int rate, required int companyId, required String token}) {
    DioHelper.postData(
            url: '$endPoint/feedback/rating/$companyId',
            data: {
              'rate': rate,
            },
            token: token)
        .then((value) {
      print(value.data);
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
