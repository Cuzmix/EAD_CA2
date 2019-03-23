import 'dart:async';
import 'dart:convert'; //used to convert json response
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_v1/Model/Product.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State createState() => ShoppingCartSate();

}


class ShoppingCartSate extends State<ShoppingCart> {
  List <Product>productList;
  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("http://10.0.2.2:5000/api/values/getProducts"),
        headers: {"Accept": "applicatin/json"});
    print(response.body);
    this.setState(() {
      productList = json.decode(response.body);
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
        body: new GridView.count(
          crossAxisCount: 2,
          children: new List<Widget>.generate(productList == null ? 0 : productList.length, (index) {
              return new GridTile(
                child: new Card(
                    color: Colors.blue.shade200,
                    child: new Center(
                      child: new Text('tile $index name is :'),
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}
