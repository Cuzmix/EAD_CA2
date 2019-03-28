import 'dart:async';
import 'dart:convert'; //used to convert json response
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:shopping_app_v1/Util/SearchFuntion.dart';
import 'package:shopping_app_v1/Util/ErrorDialog.dart';
import 'package:shopping_app_v1/Util/Querybackend.dart';

class ProductList extends StatefulWidget {
  @override
  State createState() => ProductListState();
}


class ProductListState extends State<ProductList> {

  var products = const [];

  Future<String> getData(String url) async {
    try {
      http.Response response = await http.get(
         // Uri.encodeFull("http://10.0.2.2:5000/api/values/getProducts"),
          Uri.encodeFull(url),
          headers: {"Accept": "applicatin/json"});

      print(response.body);

      List collection = json.decode(response.body);
      List<Product> _products = collection.map((json) => Product.fromJson(json)).toList();


    this.setState(() {
      products = _products;
    });

    return "success!";
    }catch(e){
      ErrorDialog();
      print (e);
    }
  }

  @override
  void initState() {
    this.getData("https://ca2-app.azurewebsites.net/api/values/getProducts");
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
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          })
        ],
      ),

    body: new GridView.count(
        crossAxisCount: 2,
        children: new List<Widget>.generate(products.length, (i) {
          Product product1 = products[i];
          return new GridTile(
            child: new Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                 new Container(
                  child: new Text("Product Name "+product1.name +"\nProduct Price : "
                      "€"+product1.price.toString()+"\nQuantity: "+product1.quantity.toString()),

                ),
                    new Container(
                      child: new OutlineButton(
                            child: new Text("Add to Cart"),
                            onPressed: null,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                        )
                    )
          ],
                ),

            ),
          );
        },
        ),
      ),

        )
    );
  }
}


