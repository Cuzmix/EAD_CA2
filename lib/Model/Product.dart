import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

//[{"id":1,"name":"Milk","price":1.5,"quantity":6},{"id":2,"name":"Cookies","price":2.0,"quantity":44}]

//@JsonSerializable(nullable: false)
class Product {
  int id;
  String name;
  double price;
  int quantity;

  Product(this.id, this.name, this.price, this.quantity);

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        quantity = json['quantity'];
}
