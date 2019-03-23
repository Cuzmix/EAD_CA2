import 'package:meta/meta.dart';

//[{"id":1,"name":"Milk","price":1.5,"quantity":6},{"id":2,"name":"Cookies","price":2.0,"quantity":44}]
class Product {
  int id;
  String name;
  double price;
  double quantity;

  Product({
  @required this.id,
  @required this.name,
  @required this.price,
  @required this.quantity
  });

  factory Product.fromJson(Map<String, dynamic> parsedJson){
    return Product(
        id: parsedJson['id'],
        name : parsedJson['name'],
        price : parsedJson ['price'],
        quantity :parsedJson['quantity']
    );
  }


}
