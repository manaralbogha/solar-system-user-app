import 'package:solar_system/models/model_devices_screen.dart';

import '../../../../models/model_get_all_company.dart';
import '../../../../models/model_get_available_appointments.dart';
import '../../../../models/model_product_for_company.dart';

abstract class DevicesStates {}

class DevicesInitialState extends DevicesStates {}

class GetAllDevicesLoadingState extends DevicesStates {}

class GetAllDevicesSuccessState extends DevicesStates {
  final DevicesScreenModel devices;
  GetAllDevicesSuccessState(this.devices);
}

class GetAllDevicesErrorState extends DevicesStates {}

class CheckDeviceState extends DevicesStates {}

class AddWorkHoursState extends DevicesStates {}

class RemoveWorkHoursState extends DevicesStates {}

class AddCountState extends DevicesStates {}

class RemoveCountState extends DevicesStates {}

class DeleteDeviceState extends DevicesStates {}

class CompanyScreenLoadingState extends DevicesStates {}

class CompanyScreenSuccessState extends DevicesStates {
  final AllCompanyModel? allCompany;
  CompanyScreenSuccessState({required this.allCompany});
}

class CompanyScreenErrorsState extends DevicesStates {}

class GetCategoryForProductIdLoadingState extends DevicesStates {}

class GetCategoryForProductIdSuccessState extends DevicesStates {
  List<Products>? panel;
  List<Products>? batter;
  List<Products>? inverter;
  List<Products>? generator;
  GetCategoryForProductIdSuccessState(
      {required this.panel,
      required this.batter,
      required this.inverter,
      required this.generator});
}

class GetCategoryForProductIdErrorsState extends DevicesStates {}

class SelectNewProductState extends DevicesStates {}

class AddQuantityState extends DevicesStates {}

class RemoveQuantityState extends DevicesStates {}

class GetAvailableAppointmentsLoadingState extends DevicesStates {}

class GetAvailableAppointmentsSuccessState extends DevicesStates {
  final GetAvailableAppointmentsModel? allAvailableAppointments;
  GetAvailableAppointmentsSuccessState(
      {required this.allAvailableAppointments});
}

class GetAvailableAppointmentsErrorsState extends DevicesStates {}

class ColorSelected extends DevicesStates {}

class MaintenanceAppointmentLoadingState extends DevicesStates {}

class MaintenanceAppointmentSuccessState extends DevicesStates {}

class MaintenanceAppointmentErrorsState extends DevicesStates {}

class CalculateBatteryNumberLoadingState extends DevicesStates {}

class CalculateBatteryNumberSuccessState extends DevicesStates {}

class CalculateBatteryNumberErrorsState extends DevicesStates {}

class SurveysLoadingState extends DevicesStates {}

class SurveysSuccessState extends DevicesStates {}

class SurveysErrorsState extends DevicesStates {}
