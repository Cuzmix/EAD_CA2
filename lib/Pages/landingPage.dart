
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';


class ShopingAppPage extends StatefulWidget {
  @override
  ShopingAppPageState createState() => new ShopingAppPageState();
}

class ShopingAppPageState extends State<ShopingAppPage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.cyan,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Lets Shop!", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            new Text("Tap to start!", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
          ],
        ),
      ),
    );
  }
}


