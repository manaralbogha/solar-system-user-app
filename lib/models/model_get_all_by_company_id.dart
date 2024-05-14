class GetAllByCompanyId {
  bool? success;
  List<Data>? data;
  String? message;

  GetAllByCompanyId({this.success, this.data, this.message});

  GetAllByCompanyId.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  String? title;
  String? message;
  int? rate;
  int? userId;
  int? companeId;
  User? user;
  Compane? compane;

  Data(
      {this.id,
      this.title,
      this.message,
      this.rate,
      this.userId,
      this.companeId,
      this.user,
      this.compane});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    rate = json['rate'];
    userId = json['user_id'];
    companeId = json['compane_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    compane =
        json['compane'] != null ? Compane.fromJson(json['compane']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['message'] = message;
    data['rate'] = rate;
    data['user_id'] = userId;
    data['compane_id'] = companeId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (compane != null) {
      data['compane'] = compane!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  Location? location;
  String? phone;
  String? email;

  User({this.id, this.name, this.location, this.phone, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}

class Location {
  String? lat;
  String? long;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['rate'] = rate;
    return data;
  }
}
