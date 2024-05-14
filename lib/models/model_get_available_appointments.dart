class GetAvailableAppointmentsModel {
  bool? success;
  List<DataAvailableAppointments>? data;
  String? message;

  GetAvailableAppointmentsModel({this.success, this.data, this.message});

  GetAvailableAppointmentsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataAvailableAppointments>[];
      json['data'].forEach((v) {
        data!.add(DataAvailableAppointments.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class DataAvailableAppointments {
  String? time;
  int? id;

  DataAvailableAppointments({this.time, this.id});

  DataAvailableAppointments.fromJson(Map<String, dynamic> json) {
    time = json['Time'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Time'] = time;
    data['id'] = id;
    return data;
  }
}
