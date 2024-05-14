class RegisterScreenModel {
  bool? success;
  String? message;
  Data? data;
  RegisterScreenModel(this.message, this.success, this.data);
  RegisterScreenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  User? user;
  Token? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }
}

class User {
  String? name;
  String? dOB;
  String? email;
  String? phone;
  Location? location;
  String? updatedAt;
  String? createdAt;
  int? id;
  List<Roles>? roles;

  User(
      {this.name,
      this.dOB,
      this.email,
      this.phone,
      this.location,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.roles});
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dOB = json['DOB'];
    email = json['email'];
    phone = json['phone'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
  }
}

class Location {
  String? lat;
  String? long;

  Location({this.lat, this.long});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
      this.name,
      this.guardName,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
}

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }
}

class Token {
  String? token;

  Token({this.token});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
