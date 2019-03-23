import 'dart:async';
import 'dart:convert'; //used to convert json response
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/material/list_tile.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State createState() => ShoppingCartSate();
}

class ShoppingCartSate extends State<ShoppingCart> {
  //List <Product> productList;
  var products = const [];

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("http://10.0.2.2:5000/api/values/getProducts"),
        headers: {"Accept": "applicatin/json"});

    print(response.body);

    List collection = json.decode(response.body);
    List<Product> _products =
        collection.map((json) => Product.fromJson(json)).toList();

    this.setState(() {
      products = _products;
    });

    // print(productList[1]);
    return "success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: "Test1234",
        home: new Scaffold(
      // this provides the bases such as white screen the nav bar etc..
      appBar: new AppBar(
        title: new Center(
          child: new Text("Products Page",
              style: new TextStyle(fontStyle: FontStyle.italic)),
        ),
      ),
      body: ListView.separated(
          itemCount: products.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (BuildContext context, int i) {
            Product product1 = products[i];
            return ListTile(
              title: new Text(product1.name+" "+product1.price.toString()),

              leading: CircleAvatar(
                child: Text("MK"),
              ),
            );
          }),
    ));
  }
}
