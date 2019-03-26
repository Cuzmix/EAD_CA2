import 'dart:async';
import 'dart:convert'; //used to convert json response
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/material/list_tile.dart';
/*
class ProductList extends StatefulWidget {
  @override
  State createState() => ProductListSate();
}

class ProductListSate extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "Test1234",
      home: new Scaffold(
        // this provides the bases such as white screen the nav bar etc..
        appBar: new AppBar(
          title: new Center(
            child: new Text("Product Info Page", style: new TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
*/