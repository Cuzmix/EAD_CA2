import 'dart:async';
import 'dart:convert'; //used to convert json response
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ShoppingCart extends StatefulWidget {
  @override
  State createState() => ShoppingCartSate();
}



class ShoppingCartSate extends State<ShoppingCart> {

  List dataList;

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "applicatin/json"});


    this.setState(() {
      dataList = json.decode(response.body);


    });
    print(dataList[1]["title"]);
    return "success!";
  }

  @override
  void initState(){
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
              child: new Text("Cart  Page",
                  style: new TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
          body: new ListView.builder(
              itemCount: dataList == null ? 0 : dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new Text(dataList[index]["body"]),
                );
              }),
        ),
      );
    }
  }
