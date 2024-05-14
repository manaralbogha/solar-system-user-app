class AllCompanyModel {
  bool? success;
  Data2? data;
  String? message;

  AllCompanyModel({this.success, this.data, this.message});

  AllCompanyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data2.fromJson(json['data']) : null;
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

class Data2 {
  int? currentPage;
  late List<DataCompany> data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  // Null? nextPageUrl;
  String? path;
  int? perPage;
  // Null? prevPageUrl;
  int? to;
  int? total;

  Data2(
      {this.currentPage,
      required this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      // this.nextPageUrl,
      this.path,
      this.perPage,
      // this.prevPageUrl,
      this.to,
      this.total});

  Data2.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataCompany>[];
      json['data'].forEach((v) {
        data.add(DataCompany.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    // nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    //  prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    // data['next_page_url'] = this.nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    // data['prev_page_url'] = this.prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class DataCompany {
  late int id;
  late String name;
  Location? location;
  late int rate;
  late String phone;
  late String logo;
  late String email;
  String? createdAt;
  String? updatedAt;

  DataCompany(
      {required this.id,
      required this.name,
      this.location,
      required this.rate,
      required this.phone,
      required this.logo,
      required this.email,
      this.createdAt,
      this.updatedAt});

  DataCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    rate = json['rate'];
    phone = json['phone'];
    logo = json['logo'];
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
    data['rate'] = rate;
    data['phone'] = phone;
    data['logo'] = logo;
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
