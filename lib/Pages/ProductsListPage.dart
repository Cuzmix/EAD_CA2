import 'dart:async';
import 'dart:convert'; //used to convert json response
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:shopping_app_v1/Pages/SearchResultsPage.dart';
import 'package:shopping_app_v1/Util/ErrorDialog.dart';
import 'package:shopping_app_v1/Util/Querybackend.dart';

class ProductList extends StatefulWidget {
  @override
  State createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {

    SendQuery s1 = new SendQuery();

    var returnedData = s1.getData("https://ca2-app.azurewebsites.net/api/values/getProducts");

    Future<List<Product>> _refresh() => s1.getData("https://ca2-app.azurewebsites.net/api/values/getProducts");//Expression body for refresh
  //  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();


    Future<String> createPost(int id, int decrementValue) async {
      try {await http.post(Uri.encodeFull("https://ca2-app.azurewebsites.net/api/values/purchaseItem/" + id.toString() + "/" + decrementValue.toString()), headers: {"Accept": "applicatin/json"});
      } catch (e) {
        print(e);
      }
      return "success!";
    }


    return MaterialApp(
        home: new Scaffold(
            // this provides the bases such as white screen the nav bar etc..
            appBar: new AppBar(
              title: new Center(
                child: new Text("Products Page",
                    style: new TextStyle(fontStyle: FontStyle.italic)),
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search), onPressed: () {showSearch(context: context, delegate: CustomSearch());
                    })
              ],
            ),
            body: new Container(
                child: new FutureBuilder<List<Product>>(
                    future: returnedData,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      } else {
                        List<Product> products = snapshot.data;
                        List<TextEditingController> _textValueController = new List(products.length);
                        for (var i = 0; i < products.length; i++) {
                          _textValueController[i] = new TextEditingController();
                        }
                        return new GridView.count(
                          crossAxisCount: 2,
                          children: new List<Widget>.generate(
                            products.length, (i) {
                              Product product1 = products[i];
                              return new GridTile(
                                child: new Card(
                                  color: Colors.white,
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new Container(
                                        child: new Text("Product Name " + product1.name + "\nProduct Price : €" + product1.price.toString() + "\nQuantity: " + product1.quantity.toString()),
                                      ),


                                      new Container(
                                        child: new Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            new TextFormField(controller: _textValueController[i],  textAlign: TextAlign.center,decoration: new InputDecoration(labelText: "Enter your number",contentPadding: const EdgeInsets.all(20.0)),
                                              keyboardType: TextInputType.number,
                                              textInputAction: TextInputAction.done,
                                              onFieldSubmitted: (term) => (createPost(product1.id, int.parse(_textValueController[i].text))),
                                            ),
                                          ],
                                        ),
                                      ),

                                      /*
                                      new Container(
                                          child: new OutlineButton(
                                              child: new Text("Purchase"),
                                              onPressed: () {createPost(product1.id, int.parse(_textValueController[i].text));
                                              },
                                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)))),*/
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                    )
            )
        )
    );
  }
}
