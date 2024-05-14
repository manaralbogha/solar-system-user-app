abstract class AppointmentStates {}

class AppointmentInitialState extends AppointmentStates {}

class GetAllCustomerOrdersLoadingState extends AppointmentStates {}

class GetAllCustomerOrdersSuccessState extends AppointmentStates {
  // ProductForCompanyModel? getProductForCompany;
  // GetAllCustomerOrdersSuccessState({this.getProductForCompany});
}

class GetAllCustomerOrdersErrorsState extends AppointmentStates {}

class GetAppointmentByIdLoadingState extends AppointmentStates {}

class GetAppointmentByIdSuccessState extends AppointmentStates {}

class GetAppointmentByIdErrorsState extends AppointmentStates {}

class ShowDetailsState extends AppointmentStates {}

class GetOrderByIdLoadingState extends AppointmentStates {}

class GetOrderByIdSuccessState extends AppointmentStates {}

class GetOrderByIdErrorsState extends AppointmentStates {}

class OrderDeletedState extends AppointmentStates {}

class DeleteOrderLoadingState extends AppointmentStates {}

class DeleteOrderSuccessState extends AppointmentStates {}

class DeleteOrderErrorsState extends AppointmentStates {}

class CreateFeedbackLoadingState extends AppointmentStates {}

class CreateFeedbackSuccessState extends AppointmentStates {}

class CreateFeedbackErrorsState extends AppointmentStates {}
