class ShowCustomerByTokenModel {
  bool? success;
  Data? data;
  String? message;

  ShowCustomerByTokenModel({this.success, this.data, this.message});

  ShowCustomerByTokenModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  Location? location;
  String? dOB;
  String? phone;
  String? email;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.location,
      this.dOB,
      this.phone,
      this.email,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    dOB = json['DOB'];
    phone = json['phone'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['DOB'] = dOB;
    data['phone'] = phone;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
