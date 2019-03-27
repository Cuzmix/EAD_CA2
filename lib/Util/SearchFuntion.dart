import 'package:flutter/material.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:shopping_app_v1/Util/Querybackend.dart';


class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    SendQuery s1 = new SendQuery();
    var getD= s1.getData("https://ca2-app.azurewebsites.net/api/values/searchProduct/"+query);

    if (query.length < 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than 1 letters.",
            ),
          )
        ],
      );
    } else {
      return new FutureBuilder<List<Product>>(
        future: getD,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return  AlertDialog(
              title: new Text("Error Message"),
              content: new Text("No Connection"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }else {
            List<Product> products = snapshot.data;
            return new GridView.count(
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
                          child: new Text("Product Name " + product1.name +
                              "\nProduct Price : "
                                  "€" + product1.price.toString() +
                              "\nQuantity: " + product1.quantity.toString()),

                        ),
                        new Container(
                            child: new OutlineButton(
                                child: new Text("Add to Cart"),
                                onPressed: null,
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        30.0))
                            )
                        )
                      ],
                    ),

                  ),
                );
              },
              ),
            );
          }
        }
      );
    }
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
