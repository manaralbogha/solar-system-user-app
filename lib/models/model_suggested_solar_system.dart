class SuggestedSolarSystemModel {
  List<Batteries>? batteries;
  List<Panels>? panels;
  List<Inverters>? inverters;

  SuggestedSolarSystemModel({this.batteries, this.panels, this.inverters});

  SuggestedSolarSystemModel.fromJson(Map<String, dynamic> json) {
    if (json['batteries'] != null) {
      batteries = <Batteries>[];
      json['batteries'].forEach((v) {
        batteries!.add(Batteries.fromJson(v));
      });
    }
    if (json['panels'] != null) {
      panels = <Panels>[];
      json['panels'].forEach((v) {
        panels!.add(Panels.fromJson(v));
      });
    }
    if (json['inverters'] != null) {
      inverters = <Inverters>[];
      json['inverters'].forEach((v) {
        inverters!.add(Inverters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (batteries != null) {
      data['batteries'] = batteries!.map((v) => v.toJson()).toList();
    }
    if (panels != null) {
      data['panels'] = panels!.map((v) => v.toJson()).toList();
    }
    if (inverters != null) {
      data['inverters'] = inverters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Batteries {
  int? id;
  String? name;
  String? image;
  String? price;
  int? batteryAmount;
  int? available;
  List<Features>? features;
  List<Company>? company;

  Batteries(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.batteryAmount,
      this.available,
      this.features,
      this.company});

  Batteries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    batteryAmount = json['battery_amount'];
    available = json['available'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) {
        company!.add(new Company.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['battery_amount'] = this.batteryAmount;
    data['available'] = this.available;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  int? id;
  String? name;
  String? type;
  String? suffix;
  String? value;

  Features({this.id, this.name, this.type, this.suffix, this.value});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    suffix = json['suffix'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['suffix'] = this.suffix;
    data['value'] = this.value;
    return data;
  }
}

class Company {
  int? id;
  String? name;
  int? rate;
  String? logo;

  Company({this.id, this.name, this.rate});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rate = json['rate'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['rate'] = this.rate;
    return data;
  }
}

class Panels {
  int? id;
  String? name;
  String? image;
  String? price;
  int? panelAmount;
  int? available;
  List<Features>? features;
  List<Company>? company;

  Panels(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.panelAmount,
      this.available,
      this.features,
      this.company});

  Panels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    panelAmount = json['panel_amount'];
    available = json['available'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) {
        company!.add(new Company.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['panel_amount'] = this.panelAmount;
    data['available'] = this.available;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Inverters {
  int? id;
  String? name;
  String? image;
  String? price;
  int? available;
  List<Features>? features;
  List<Company>? company;

  Inverters(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.available,
      this.features,
      this.company});

  Inverters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    available = json['available'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) {
        company!.add(new Company.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['available'] = this.available;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
