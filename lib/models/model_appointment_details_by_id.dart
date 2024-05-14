class AppointmentDetailsByIdModel {
  bool? success;
  Data? data;
  String? message;

  AppointmentDetailsByIdModel({this.success, this.data, this.message});

  AppointmentDetailsByIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? type;
  String? status;
  String? startTime;
  String? finishTime;
  int? days;
  Compane? compane;
  Team? team;
  OrderTeam? order;

  Data(
      {this.id,
      this.type,
      this.status,
      this.startTime,
      this.finishTime,
      this.days,
      this.compane,
      this.team,
      this.order});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    startTime = json['startTime'];
    finishTime = json['finishTime'];
    days = json['days'];
    compane =
        json['compane'] != null ? Compane.fromJson(json['compane']) : null;
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    order = json['order'] != null ? OrderTeam.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['status'] = status;
    data['startTime'] = startTime;
    data['finishTime'] = finishTime;
    data['days'] = days;
    if (compane != null) {
      data['compane'] = compane!.toJson();
    }
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Compane {
  int? id;
  String? name;

  Compane({this.id, this.name});

  Compane.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  LocationTeam? location;
  int? available;
  String? email;
  String? phone;
  String? finishAt;

  Team(
      {this.id,
      this.name,
      this.location,
      this.available,
      this.email,
      this.phone,
      this.finishAt});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? LocationTeam.fromJson(json['location'])
        : null;
    available = json['available'];
    email = json['email'];
    phone = json['phone'];
    finishAt = json['FinishAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['available'] = available;
    data['email'] = email;
    data['phone'] = phone;
    data['FinishAt'] = finishAt;
    return data;
  }
}

class LocationTeam {
  String? lat;
  String? long;
  String? area;

  LocationTeam({this.lat, this.long, this.area});

  LocationTeam.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    data['area'] = area;
    return data;
  }
}

class OrderTeam {
  int? id;
  String? totalVoltage;
  int? totalPrice;
  String? hoursOnCharge;
  String? hoursOnBettary;
  String? space;
  Location? location;

  OrderTeam(
      {this.id,
      this.totalVoltage,
      this.totalPrice,
      this.hoursOnCharge,
      this.hoursOnBettary,
      this.space,
      this.location});

  OrderTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalVoltage = json['total_voltage'];
    totalPrice = json['total_price'];
    hoursOnCharge = json['hours_on_charge'];
    hoursOnBettary = json['hours_on_bettary'];
    space = json['space'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_voltage'] = totalVoltage;
    data['total_price'] = totalPrice;
    data['hours_on_charge'] = hoursOnCharge;
    data['hours_on_bettary'] = hoursOnBettary;
    data['space'] = space;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Location {
  double? lat;
  double? long;
  String? area;

  Location({this.lat, this.long, this.area});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    data['area'] = area;
    return data;
  }
}
