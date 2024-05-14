import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';
import 'package:solar_system/shared/network/remote/dio_helper.dart';

import '../../../../models/model_devices_screen.dart';

import '../../../../models/model_get_available_appointments.dart';
import '../../../../models/model_product_for_company.dart';
import '../../../../models/model_suggested_solar_system.dart';
import '../../../../models/model_survey.dart';
import '../../../../shared/const/const.dart';
import '../../../../models/model_get_all_company.dart';

class DevicesCubit extends Cubit<DevicesStates> {
  DevicesCubit() : super(DevicesInitialState());
  static DevicesCubit get(context) => BlocProvider.of(context);
//  int currentValue = 50000;

  final formKey = GlobalKey<FormState>();

  final dayAutomationController = TextEditingController();

  final sunAvgHoursController = TextEditingController();
  int? hoursOnBattery;
  DevicesScreenModel? devices;
  List<Data1> deviceCheck = [];
  List<Map<String, dynamic>> listDeviceMap = [];
  int totalWatt = 0;
  int oldWattPerDay = 0;
  int totalWattOnPower = 0;
  int oldTotalWattOnPower = 0;
  int totalInverterWatt = 0;
  int oldTotalInverterWatt = 0;
  int indexPanel = 0;
  int indexBatter = 0;
  int indexInverter = 0;
  int indexGenerator = 0;
  List<Products> productsSelected = [];
  List<Map<String, dynamic>> listProductsMap = [];
  Color selectedColor = Colors.white;
  Color selectedTextColor = Colors.black;
  int? selectedId;
  String? availableAppointment;
  int? availableAppointmentId;

  int? totalPrice;
  double? lat;
  double? long;
  String syrianProvince = "Damascus";
  List<String> syrianProvinces = [
    "Damascus",
    "Damascus Countryside",
    "Kenitra",
    "Daraa",
    "Suwayda",
    "Homs",
    "Tartous",
    "Latakia",
    "Hama",
    "Idlib",
    "Allepo",
    "Raqqa",
    "Deir Ezzor",
    "Al-Hasakah",
  ];

  void getAllDevices({required String token}) {
    //print(token);
    emit(GetAllDevicesLoadingState());
    DioHelper.getData(
      url: '$endPoint/device',
      token: token,
    ).then((value) {
      print(value.data);
      devices = DevicesScreenModel.fromJson(value.data);
      //lin = devices!.data.length;
      //isChecked = List.generate(lin, (index) => false);
      // print(isChecked);

      // print(devices!.data[0].count);

      emit(GetAllDevicesSuccessState(devices!));
    }).catchError((error) {
      print(error.toString());
      emit(GetAllDevicesErrorState());
    });
  }

  void checkDevice(
    bool? value,
    Data1 devices,
  ) {
    devices.isChecked = value!;

    if (value == true) {
      selected(devices);
      dailyLoadCalculationForEachDevice(devices);
      dailyLoadOnPowerCalculationForEachDevice(devices);
      dailyLoadInverterWattCalculationForEachDevice(devices);
      sumTotalWatt(devices);
      sumTotalWattOnPower(devices);
      sumTotalInverterWatt(devices);
    } else {
      notSelected(devices);
      dailyLoadCalculationForEachDevice(devices);
      dailyLoadOnPowerCalculationForEachDevice(devices);
      dailyLoadInverterWattCalculationForEachDevice(devices);
      minusTotalWatt(devices);
      minusTotalWattOnPower(devices);
      minusTotalInverterWatt(devices);
    }
    emit(CheckDeviceState());
  }

  void dailyLoadCalculationForEachDevice(
    Data1 devices,
  ) {
    devices.wattPerDay =
        (int.parse(devices.voltage)) * (devices.count * devices.workHours);
    //print(devices.wattPerDay);
  }

  void dailyLoadOnPowerCalculationForEachDevice(
    Data1 devices,
  ) {
    devices.wattPerDayOnPower =
        (int.parse(devices.voltagePower)) * (devices.count);
    // print(devices.wattPerDayOnPower);
  }

  void dailyLoadInverterWattCalculationForEachDevice(
    Data1 devices,
  ) {
    devices.inverterWatt = (int.parse(devices.voltage)) * (devices.count);
    print(devices.inverterWatt);
  }

  void selected(
    Data1 devices,
  ) {
    deviceCheck.add(devices);

    //print(deviceCheck);
  }

  void addDevicesToMap(
    List<Data1> deviceCheck,
  ) {
    listDeviceMap = [];
    for (var element in deviceCheck) {
      listDeviceMap.add({
        "device_id": element.id,
        "ammount": element.count,
      });
    }

    print(listDeviceMap.toString());
  }

  void addProductsToMap(
    List<Products> productsSelected,
  ) {
    listProductsMap = [];
    for (var element in productsSelected) {
      listProductsMap.add({
        "product_id": element.id,
        "ammount": element.quantity,
      });
    }
    print(listProductsMap.toList());
  }

  void addProductsSuggestedToMap(
    SuggestedSolarSystemModel suggestedSolarSystemModel,
    int indexInverter,
  ) {
    listProductsMap = [];
    listProductsMap.add({
      "product_id": suggestedSolarSystemModel.panels![indexInverter].id,
      "ammount": suggestedSolarSystemModel.panels![indexInverter].panelAmount,
    });
    listProductsMap.add({
      "product_id": suggestedSolarSystemModel.batteries![indexInverter].id,
      "ammount":
          suggestedSolarSystemModel.batteries![indexInverter].batteryAmount,
    });
    listProductsMap.add({
      "product_id": suggestedSolarSystemModel.inverters![indexInverter].id,
      "ammount": 1,
    });

    // for (var element in productsSelected) {
    //   listProductsMap.add({
    //     "product_id": element.id,
    //     "ammount": element.quantity,
    //   });
    // }
    print(listProductsMap.toList());
  }

  void sumTotalWatt(Data1 device) {
    totalWatt += device.wattPerDay;
    // print(totalWatt);
  }

  void sumTotalWattOnPower(Data1 device) {
    totalWattOnPower += device.wattPerDayOnPower;
    //print(totalWattOnPower);
  }

  void sumTotalInverterWatt(Data1 device) {
    totalInverterWatt += device.inverterWatt;
    // print(totalWatt);
  }

  void editSumTotalWatt(Data1 device) {
    if (device.wattPerDay >= oldWattPerDay) {
      totalWatt += (device.wattPerDay - oldWattPerDay);
    } else {
      totalWatt -= (device.wattPerDay);
    }
    // print(totalWatt);
    oldWattPerDay = 0;
  }

  void editSumTotalWattOnPower(Data1 device) {
    if (device.wattPerDayOnPower >= oldTotalWattOnPower) {
      totalWattOnPower += (device.wattPerDayOnPower - oldTotalWattOnPower);
    } else {
      totalWattOnPower -= (device.wattPerDayOnPower);
    }
    // print(totalWatt);
    oldTotalWattOnPower = 0;
  }

  void editSumTotalInverterWatt(Data1 device) {
    if (device.inverterWatt >= oldTotalInverterWatt) {
      totalInverterWatt += (device.inverterWatt - oldTotalInverterWatt);
    } else {
      totalInverterWatt -= (device.inverterWatt);
    }
    // print(totalWatt);
    oldTotalInverterWatt = 0;
  }

  void minusTotalWattOnPower(Data1 device) {
    totalWattOnPower -= device.wattPerDayOnPower;
    print(totalWattOnPower);
  }

  void minusTotalWatt(Data1 device) {
    totalWatt -= device.wattPerDay;
    //print(totalWatt);
  }

  void minusTotalInverterWatt(Data1 device) {
    totalInverterWatt -= device.inverterWatt;
    //print(totalWatt);
  }

  void notSelected(
    Data1 devices,
  ) {
    deviceCheck.removeWhere((element) => element.id == devices.id);
    //listDeviceMap = [];
    // listDeviceMap.removeWhere(
    //   (element) => element["product_id"] == devices.id,
    // );
    // print(listDeviceMap.toString());
    // print(deviceCheck);
  }

  void addWorkHours(
    Data1 deviceCheck,
  ) {
    deviceCheck.workHours++;
    //print(deviceCheck.workHours);
    emit(AddWorkHoursState());
  }

  void removeWorkHours(
    Data1 deviceCheck,
  ) {
    if (deviceCheck.workHours > 1) {
      deviceCheck.workHours--;
    }

    print(deviceCheck.workHours);
    emit(RemoveWorkHoursState());
  }

  void addCount(
    Data1 deviceCheck,
  ) {
    deviceCheck.count++;
    print(deviceCheck.count);
    emit(AddCountState());
  }

  void removeCount(
    Data1 deviceCheck,
  ) {
    if (deviceCheck.count > 1) {
      deviceCheck.count--;
    }

    print(deviceCheck.count);
    emit(RemoveCountState());
  }

  AllCompanyModel? allCompany;
  void getAllCompany({
    required String token,
  }) {
    emit(CompanyScreenLoadingState());
    DioHelper.getData(
      url: '$endPoint/company',
      token: token,
    ).then((value) {
      print(value.data);
      allCompany = AllCompanyModel.fromJson(value.data);
      print(allCompany!.data!.data[0].name);
      emit(CompanyScreenSuccessState(allCompany: allCompany));
    }).catchError((error) {
      print(error.toString);
      emit(CompanyScreenErrorsState());
    });
  }

  ProductForCompanyModel? allProductsByCompanyId;
  List<Products>? panel = [];
  List<Products>? batter = [];
  List<Products>? inverter = [];
  List<Products>? generator = [];

  void getProductsForCompanyId({
    required String token,
    required int idCompany,
  }) {
    print(idCompany);
    emit(GetCategoryForProductIdLoadingState());
    //panel = [];
    DioHelper.getData(url: '$endPoint/company/productID', token: token, query: {
      'company_id': idCompany,
    }).then((value) async {
      allProductsByCompanyId = ProductForCompanyModel.fromJson(value.data);
      filterProductsByCompanyId(idCompany: idCompany);
      // print(value.data);

      emit(
        GetCategoryForProductIdSuccessState(
            panel: panel,
            batter: batter,
            inverter: inverter,
            generator: generator),
      );
    }).catchError((error) {
      emit(GetCategoryForProductIdErrorsState());
    });
  }

  void filterProductsByCompanyId({
    required int idCompany,
  }) {
    for (var element in allProductsByCompanyId!.data![0].products) {
      if (element.categore!.id == 2) {
        panel!.add(element);
      }
      if (element.categore!.id == 4) {
        batter!.add(element);
      }
      if (element.categore!.id == 3) {
        inverter!.add(element);
      }
      if (element.categore!.id == 5) {
        generator!.add(element);
      }
    }
  }

  void selectNewProduct() {
    emit(SelectNewProductState());
  }

  void addQuantity(Products generalProduct) {
    generalProduct.quantity++;

    emit(AddQuantityState());
  }

  void removeQuantity(Products generalProduct) {
    if (generalProduct.quantity > 1) {
      generalProduct.quantity--;
    }

    emit(RemoveQuantityState());
  }

  GetAvailableAppointmentsModel? allAvailableAppointments;
  void getAvailableAppointments({
    required String token,
    required int companyId,
    //required String area,
  }) {
    emit(GetAvailableAppointmentsLoadingState());
    DioHelper.getData(url: "$endPoint/order/available", token: token, query: {
      'company_id': companyId,
      'area': 'Dimashq',
    }).then((value) {
      print(value.data);
      allAvailableAppointments =
          GetAvailableAppointmentsModel.fromJson(value.data);
      print(allAvailableAppointments!.data![0].time);
      emit(GetAvailableAppointmentsSuccessState(
          allAvailableAppointments: allAvailableAppointments));
    }).catchError((error) {
      emit(GetAvailableAppointmentsErrorsState());
    });
  }

  void colorSelected(int index) {
    selectedId = allAvailableAppointments!.data![index].id;
    // allAvailableAppointments!.data!.forEach(
    //   (element) {
    //     if (element.id == selectedId) {
    //       selectedColor = Colors.green.withOpacity(0.5);
    //     } else {
    //       selectedColor = Colors.white;
    //     }
    //   },
    // );
    emit(ColorSelected());
  }

  void createOrder(
      {required String token,
      required String totalVoltage,
      required String totalPrice,
      required String hoursOnCharge,
      required String hoursOnBattery,
      required String space,
      required double? lat,
      required double? long,
      required String area,
      required List<Map<String, dynamic>> products,
      required List<Map<String, dynamic>> devices,
      required int? teamId,
      required String? startTime,
      required int companyId}) {
    DioHelper.postData(
      url: "$endPoint/order/create",
      data: {
        "order": {
          "total_voltage": totalVoltage,
          "total_price": totalPrice,
          "hours_on_charge": hoursOnCharge,
          "hours_on_bettary": hoursOnBattery,
          "space": space,
          "lat": lat,
          "long": long,
          "area": area
        },
        "products": products,
        "devices": devices,
        "team_id": teamId,
        "appointment": {"startTime": startTime, "compane_id": companyId}
      },
      token: token,
    ).then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void updateOrder({
    required int idOrder,
    required String token,
    required String totalVoltage,
    required String totalPrice,
    required String hoursOnCharge,
    required String hoursOnBattery,
    required String space,
    required double lat,
    required double long,
    required String area,
    required List<Map<String, dynamic>> products,
    required List<Map<String, dynamic>> devices,
  }) {
    print('2222222222');
    DioHelper.putData(
      url: "$endPoint/order/update/$idOrder",
      data: {
        "order": {
          "total_voltage": totalVoltage,
          "total_price": totalPrice,
          "hours_on_charge": hoursOnCharge,
          "hours_on_bettary": hoursOnBattery,
          "space": space,
          "lat": lat,
          "long": long,
          "area": area
        },
        "products": products,
        "devices": devices,
      },
      token: token,
    ).then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void updateDetectionAppointment({
    required String token,
    required String startTime,
    required int teamId,
    required int idOrder,
  }) {
    DioHelper.postData(
      url: '$endPoint/appointment/UpdateDetection/$idOrder',
      data: {'startTime': startTime, 'team_id': teamId},
      token: token,
    ).then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void orderStatus(
      {required String token, required String status, required int idOrder}) {
    DioHelper.postData(
            url: '$endPoint/appointment/OrderStatus/$idOrder?',
            data: {},
            query: {'status': status},
            token: token)
        .then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void maintenanceAppointment({
    required String startTime,
    required int teamId,
    required int companyId,
    required double lat,
    required double long,
    required String area,
    required String token,
  }) {
    emit(MaintenanceAppointmentLoadingState());
    DioHelper.postData(
      url: '$endPoint/appointment/maintenance',
      data: {
        "startTime": startTime,
        "team_id": teamId,
        "compane_id": companyId,
        "lat": lat,
        "long": long,
        "area": area,
      },
      token: token,
    ).then((value) {
      print(value.data);
      emit(MaintenanceAppointmentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MaintenanceAppointmentErrorsState());
    });
  }

  List<dynamic> suggestedSolarSystem = [];
  List<SuggestedSolarSystemModel> suggestedSolarSystemModel = [];
  void calculateBatteryNumber({
    required int totalWhatt,
    required int dayAutomation,
    required String area,
    required int sunAvgHours,
    required int inverterWatt,
    required String token,
  }) {
    emit(CalculateBatteryNumberLoadingState());
    DioHelper.getData(
            url: "$endPoint/order/calculateBatteryNumber",
            query: {
              "totalWhatt": totalWhatt,
              "day_automation": dayAutomation,
              "area": "Dimashq",
              "sunAvgHours": sunAvgHours,
              "InverterWatt": inverterWatt
            },
            token: token)
        .then((value) {
      suggestedSolarSystemModel = [];
      suggestedSolarSystem = value.data;
      // print(suggestedSolarSystem[0]);

      // print(value.data[0]);
      for (int i = 0; i < suggestedSolarSystem.length; i++) {
        suggestedSolarSystemModel
            .add(SuggestedSolarSystemModel.fromJson(suggestedSolarSystem[i]));
        print(suggestedSolarSystemModel[0].inverters);
      }
      // suggestedSolarSystemModel
      //     .add(SuggestedSolarSystemModel.fromJson(value.data[0]));
      // print(suggestedSolarSystemModel[0].batteries![0].name);
      // print(suggestedSolarSystemModel.length);
      emit(CalculateBatteryNumberSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CalculateBatteryNumberErrorsState());
    });
  }

  SurveyModel? surveyModel;
  void surveys({required String token}) {
    emit(SurveysLoadingState());
    DioHelper.getData(url: '$endPoint/user/survey', token: token).then((value) {
      print(value.data);
      surveyModel = SurveyModel.fromJson(value.data);
      emit(SurveysSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SurveysErrorsState());
    });
  }
}
