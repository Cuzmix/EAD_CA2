import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_app_v1/Pages/ProductsPage.dart';

void main() {
  runApp(new MaterialApp(
    home: new ShopingAppPage(),
  ));
}

class ShopingAppPage extends StatefulWidget {
  @override
  ShopingAppPageState createState() => new ShopingAppPageState();
}

class ShopingAppPageState extends State<ShopingAppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: "Test1234",
        home: new Scaffold(
      // this provides the bases such as white screen the nav bar etc..
      appBar: new AppBar(
        title: new Center(
          child: new Text(
            "Shopping App",
            style: new TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new ShoppingCart())))
        ],
      ),
      body: new Center(
        child: new RaisedButton(
    child: new Text("Get data"),
    onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
    builder: (BuildContext context) => new ShoppingCart()))),
    ), //calling the page to load
    ));
  }
}
