class DevicesScreenModel {
  bool? success;
  Data? data;
  String? message;

  DevicesScreenModel({this.success, this.data, this.message});

  DevicesScreenModel.fromJson(Map<String, dynamic> json) {
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
  List<Data1>? data;
  Links? links;
  Meta? meta;

  Data({this.data, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data1>[];
      json['data'].forEach((v) {
        data!.add(Data1.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data1 {
  int? id;
  late String name;
  late String image;
  late String voltage;
  late String voltagePower;
  int? fazesNumber;
  bool isChecked = false;
  int count = 1;
  int workHours = 1;
  int wattPerDay = 0;
  int wattPerDayOnPower = 0;
  int inverterWatt = 0;

  List<Type>? type;

  Data1(
      {this.id,
      required this.name,
      required this.image,
      required this.voltage,
      required this.voltagePower,
      this.fazesNumber,
      required this.isChecked,
      required this.count,
      required this.workHours,
      required this.wattPerDay,
      required this.wattPerDayOnPower,
      required this.inverterWatt,
      this.type});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    voltage = json['voltage'];
    voltagePower = json['voltagePower'];
    fazesNumber = json['FazesNumber'];
    if (json['type'] != null) {
      type = <Type>[];
      json['type'].forEach((v) {
        type!.add(Type.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['voltage'] = voltage;
    data['voltagePower'] = voltagePower;
    data['FazesNumber'] = fazesNumber;
    if (type != null) {
      data['type'] = type!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Type {
  int? id;
  String? name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
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

class Links {
  String? first;
  String? last;
  // Null? prev;
  // Null? next;

  Links({this.first, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    // prev = json['prev'];
    // next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    // data['prev'] = this.prev;
    // data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links1>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links1>[];
      json['links'].forEach((v) {
        links!.add(Links1.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Links1 {
  String? url;
  String? label;
  bool? active;

  Links1({this.url, this.label, this.active});

  Links1.fromJson(Map<String, dynamic> json) {
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
