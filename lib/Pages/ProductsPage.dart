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
        Uri.encodeFull("http://10.0.2.2:5000/api/values/getProducts"),
        headers: {"Accept": "applicatin/json"});
    print(response.body);
    this.setState(() {
      dataList = json.decode(response.body);

    });
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
          body: new Container(
            child: Card(
              elevation: 4.0,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3G8lLr-twsQqYhffaDRMzgXaBdfx_FwEvkBRHJ3_1-bJyknVc",
                      ),
                      height: 250.0,
                      width: MediaQuery.of(context).size.width / 2.2,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Title",
                              style:
                                  TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "Main Price",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "used to be price",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "precentage off",
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ]),
            ),
          )),
    );
  }
}
