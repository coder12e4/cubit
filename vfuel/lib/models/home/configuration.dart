import 'package:optional/optional.dart';

class Configuration {
  Configuration({
    this.id,
    this.name,
    this.radius,
    // this.latlng = null,
    this.products,
    this.maxDate,
  });

  String? id;
  String? name;
  int? radius;
  // Latlng latlng;
  List<Product>? products;
  int? maxDate;

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
        id: json["_id"],
        name: json["name"],
        radius: json["radius"],
        // latlng: Latlng.fromJson(json["latlng"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        maxDate: json["maxDate"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "radius": radius,
        // "latlng": latlng.toJson(),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "maxDate": maxDate,
      };
}

class Latlng {
  Latlng({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory Latlng.fromJson(Map<String, dynamic> json) => Latlng(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Product {
  Product({
    this.name,
    this.price,
  });

  String? name;
  int? price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };
}
