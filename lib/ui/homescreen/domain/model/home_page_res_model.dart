import 'package:hive/hive.dart';
import 'dart:convert';

part 'home_page_res_model.g.dart';

HomePageResModel homePageResModelFromJson(String str) => HomePageResModel.fromJson(json.decode(str));

String homePageResModelToJson(HomePageResModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class HomePageResModel {
  @HiveField(1)
  final bool? success;
  @HiveField(2)
  final List<Product>? products;

  HomePageResModel({
    this.success,
    this.products,
  });

  factory HomePageResModel.fromJson(Map<String, dynamic> json) => HomePageResModel(
    success: json["success"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };

  static HomePageResModel getDummyData() {
    return HomePageResModel(
      success: true,
      products: List.generate(
        6,
        (index) => Product(
          id: "$index",
          name: "Product Name",
          description: "Product Description",
          stockStatus: "In Stock",
          manufacturer: "Manufacturer",
          quantity: "10",
          reviews: "0 reviews",
          price: "\$99.99",
          thumb: "placeholder.jpg",
          special: false,
          rating: 5,
        ),
      ),
    );
  }
}

@HiveType(typeId: 2)
class Product {
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final dynamic description;
  @HiveField(4)
  final String? stockStatus;
  @HiveField(5)
  final dynamic manufacturer;
  @HiveField(6)
  final String? quantity;
  @HiveField(7)
  final dynamic reviews;
  @HiveField(8)
  final String? price;
  @HiveField(9)
  final String? thumb;
  @HiveField(10)
  final bool? special;
  @HiveField(11)
  final int? rating;

  Product({
    this.id,
    this.name,
    this.description,
    this.stockStatus,
    this.manufacturer,
    this.quantity,
    this.reviews,
    this.price,
    this.thumb,
    this.special,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    stockStatus: json["stock_status"],
    manufacturer: json["manufacturer"],
    quantity: json["quantity"],
    reviews: json["reviews"],
    price: json["price"],
    thumb: json["thumb"],
    special: json["special"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "stock_status": stockStatus,
    "manufacturer": manufacturer,
    "quantity": quantity,
    "reviews": reviews,
    "price": price,
    "thumb": thumb,
    "special": special,
    "rating": rating,
  };
}
