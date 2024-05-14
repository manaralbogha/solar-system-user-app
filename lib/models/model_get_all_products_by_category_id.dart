// class GetAllProductsByCategoryIdModel {
//   bool? success;
//   List<DataProductsByCategory>? data;
//   String? message;

//   GetAllProductsByCategoryIdModel({this.success, this.data, this.message});

//   GetAllProductsByCategoryIdModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['data'] != null) {
//       data = <DataProductsByCategory>[];
//       json['data'].forEach((v) {
//         data!.add(DataProductsByCategory.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }

// class DataProductsByCategory {
//   int? id;
//   String? name;
//   List<Products>? products;

//   DataProductsByCategory({this.id, this.name, this.products});

//   DataProductsByCategory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Products {
//   int? id;
//   late String name;
//   late String image;
//   String? price;
//   int? available;
//   List<Features>? features;
//   List<Company>? company;

//   Products(
//       {this.id,
//       required this.name,
//       required this.image,
//       this.price,
//       this.available,
//       this.features,
//       this.company});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     price = json['price'];
//     available = json['available'];
//     if (json['features'] != null) {
//       features = <Features>[];
//       json['features'].forEach((v) {
//         features!.add(Features.fromJson(v));
//       });
//     }
//     if (json['company'] != null) {
//       company = <Company>[];
//       json['company'].forEach((v) {
//         company!.add(new Company.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['price'] = this.price;
//     data['available'] = this.available;
//     if (this.features != null) {
//       data['features'] = this.features!.map((v) => v.toJson()).toList();
//     }
//     if (this.company != null) {
//       data['company'] = this.company!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Features {
//   int? id;
//   String? name;
//   String? type;
//   String? suffix;
//   String? value;

//   Features({this.id, this.name, this.type, this.suffix, this.value});

//   Features.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     type = json['type'];
//     suffix = json['suffix'];
//     value = json['value'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['type'] = this.type;
//     data['suffix'] = this.suffix;
//     data['value'] = this.value;
//     return data;
//   }
// }

// class Company {
//   int? id;
//   String? name;

//   Company({this.id, this.name});

//   Company.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Panel {
//   int? id;
//   String name;
//   String image;
//   String price;
//   String? Wattage;
//   String? Size;

//   Panel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.Wattage,
//     required this.Size,
//   });
// }
