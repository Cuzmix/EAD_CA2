import 'package:flutter/material.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';
import 'package:shopping_app_v1/Util/Localization.dart';



class ShoppingAppPage extends StatefulWidget {
  @override
  ShoppingAppPageState createState() => new ShoppingAppPageState();
}

class ShoppingAppPageState extends State<ShoppingAppPage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.cyan,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(DemoLocalizations.of(context).letsShop, style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            new Text(DemoLocalizations.of(context).tapToStart, style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
          ],
        ),
      ),
    );
  }
}


