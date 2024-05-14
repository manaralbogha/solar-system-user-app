class ProductForCompanyModel {
  bool? success;
  List<DataProducts>? data;
  String? message;

  ProductForCompanyModel({this.success, this.data, this.message});

  ProductForCompanyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataProducts>[];
      json['data'].forEach((v) {
        data!.add(DataProducts.fromJson(v));
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

class DataProducts {
  int? id;
  String? name;
  late List<Products> products;

  DataProducts({this.id, this.name, required this.products});

  DataProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (products != null) {
      data['products'] = products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  late String name;
  late String image;
  late String price;
  int quantity = 1;
  int? available;
  Categore? categore;
  List<Features>? features;

  Products(
      {this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.quantity,
      this.available,
      this.categore,
      this.features});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    available = json['available'];
    categore =
        json['categore'] != null ? Categore.fromJson(json['categore']) : null;
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['available'] = available;
    if (categore != null) {
      data['categore'] = categore!.toJson();
    }
    if (features != null) {
      data['features'] = features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categore {
  int? id;
  String? name;

  Categore({this.id, this.name});

  Categore.fromJson(Map<String, dynamic> json) {
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
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['suffix'] = suffix;
    data['value'] = value;
    return data;
  }
}
