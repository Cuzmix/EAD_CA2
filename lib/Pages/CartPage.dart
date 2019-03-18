import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ShoppingCart extends StatefulWidget{
  @override
  ShoppingCartState createState()=>ShoppingCartSate();

}

class ShoppingCartSate extends State<ShoppingCart>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(
            "Shopping App", style: new TextStyle(fontStyle: FontStyle.italic),
          ),
        ),

        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_basket,color: Colors.white,)
              , onPressed: null)
        ],
      ),

    );
  }

}