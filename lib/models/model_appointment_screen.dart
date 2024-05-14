// class AppointmentModel {
//   bool? success;
//   List<Data>? data;
//   String? message;

//   AppointmentModel({this.success, this.data, this.message});

//   AppointmentModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['success'] = success;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = message;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   LocationUser? location;
//   String? phone;
//   String? email;
//   List<Order>? order;

//   Data({this.id, this.name, this.location, this.phone, this.email, this.order});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     location = json['location'] != null
//         ? LocationUser.fromJson(json['location'])
//         : null;
//     phone = json['phone'];
//     email = json['email'];
//     if (json['order'] != null) {
//       order = <Order>[];
//       json['order'].forEach((v) {
//         order!.add(Order.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     data['phone'] = phone;
//     data['email'] = email;
//     if (order != null) {
//       data['order'] = order!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class LocationUser {
//   String? lat;
//   String? long;
//   String? area;

//   LocationUser({this.lat, this.long, this.area});

//   LocationUser.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     long = json['long'];
//     area = json['area'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['lat'] = lat;
//     data['long'] = long;
//     data['area'] = area;
//     return data;
//   }
// }

// class Order {
//   int? id;
//   String? totalVoltage;
//   int? totalPrice;
//   String? hoursOnCharge;
//   String? hoursOnBettary;
//   String? space;
//   Location? location;
//   Appointment? appointment;
//   bool? showDetails = false;

//   Order(
//       {this.id,
//       this.totalVoltage,
//       this.totalPrice,
//       this.hoursOnCharge,
//       this.hoursOnBettary,
//       this.space,
//       this.location,
//       this.appointment,
//       this.showDetails});

//   Order.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     totalVoltage = json['total_voltage'];
//     totalPrice = json['total_price'];
//     hoursOnCharge = json['hours_on_charge'];
//     hoursOnBettary = json['hours_on_bettary'];
//     space = json['space'];
//     location =
//         json['location'] != null ? Location.fromJson(json['location']) : null;
//     appointment = json['appointment'] != null
//        Appointment.fromJson(json['appointment'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['total_voltage'] = totalVoltage;
//     data['total_price'] = totalPrice;
//     data['hours_on_charge'] = hoursOnCharge;
//     data['hours_on_bettary'] = hoursOnBettary;
//     data['space'] = space;
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     if (appointment != null) {
//       data['appointment'] = appointment!.toJson();
//     }
//     return data;
//   }
// }

// class Location {
//   double? lat;
//   double? long;
//   String? area;

//   Location({this.lat, this.long, this.area});

//   Location.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     long = json['long'];
//     area = json['area'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['lat'] = lat;
//     data['long'] = long;
//     data['area'] = area;
//     return data;
//   }
// }

// class Appointment {
//   int? id;
//   String? type;
//   String? status;
//   String? startTime;
//   String? finishTime;
//   int? days;
//   Compane? compane;

//   Appointment(
//       {this.id,
//       this.type,
//       this.status,
//       this.startTime,
//       this.finishTime,
//       this.days,
//       this.compane});

//   Appointment.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     type = json['type'];
//     status = json['status'];
//     startTime = json['startTime'];
//     finishTime = json['finishTime'];
//     days = json['days'];
//     compane =
//         json['compane'] != null ? Compane.fromJson(json['compane']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['type'] = type;
//     data['status'] = status;
//     data['startTime'] = startTime;
//     data['finishTime'] = finishTime;
//     data['days'] = days;
//     if (compane != null) {
//       data['compane'] = compane!.toJson();
//     }
//     return data;
//   }
// }

// class Compane {
//   int? id;
//   String? name;

//   Compane({this.id, this.name});

//   Compane.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     return data;
//   }
// }

class AppointmentModel {
  bool? success;
  List<Data>? data;
  String? message;

  AppointmentModel({this.success, this.data, this.message});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  LocationUser? location;
  String? phone;
  String? email;
  List<Order>? order;

  Data({this.id, this.name, this.location, this.phone, this.email, this.order});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? new LocationUser.fromJson(json['location'])
        : null;
    phone = json['phone'];
    email = json['email'];
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order!.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['phone'] = this.phone;
    data['email'] = this.email;
    if (this.order != null) {
      data['order'] = this.order!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationUser {
  String? lat;
  String? long;
  String? area;

  LocationUser({this.lat, this.long, this.area});

  LocationUser.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['area'] = this.area;
    return data;
  }
}

class Order {
  int? id;
  String? totalVoltage;
  int? totalPrice;
  String? hoursOnCharge;
  String? hoursOnBettary;
  String? space;
  Location? location;
  Appointment? appointment;
  bool? showDetails = false;

  Order(
      {this.id,
      this.totalVoltage,
      this.totalPrice,
      this.hoursOnCharge,
      this.hoursOnBettary,
      this.space,
      this.location,
      this.appointment,
      this.showDetails});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalVoltage = json['total_voltage'];
    totalPrice = json['total_price'];
    hoursOnCharge = json['hours_on_charge'];
    hoursOnBettary = json['hours_on_bettary'];
    space = json['space'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    appointment = json['appointment'] != null
        ? new Appointment.fromJson(json['appointment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total_voltage'] = this.totalVoltage;
    data['total_price'] = this.totalPrice;
    data['hours_on_charge'] = this.hoursOnCharge;
    data['hours_on_bettary'] = this.hoursOnBettary;
    data['space'] = this.space;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.appointment != null) {
      data['appointment'] = this.appointment!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['area'] = this.area;
    return data;
  }
}

class Appointment {
  int? id;
  String? type;
  String? status;
  String? startTime;
  String? finishTime;
  int? days;
  Compane? compane;

  Appointment(
      {this.id,
      this.type,
      this.status,
      this.startTime,
      this.finishTime,
      this.days,
      this.compane});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    startTime = json['startTime'];
    finishTime = json['finishTime'];
    days = json['days'];
    compane =
        json['compane'] != null ? new Compane.fromJson(json['compane']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['status'] = this.status;
    data['startTime'] = this.startTime;
    data['finishTime'] = this.finishTime;
    data['days'] = this.days;
    if (this.compane != null) {
      data['compane'] = this.compane!.toJson();
    }
    return data;
  }
}

class Compane {
  int? id;
  String? name;
  int? rate;

  Compane({this.id, this.name, this.rate});

  Compane.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rate'] = this.rate;
    return data;
  }
}
