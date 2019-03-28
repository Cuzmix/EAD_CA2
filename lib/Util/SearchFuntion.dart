import 'package:flutter/material.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:shopping_app_v1/Util/Querybackend.dart';


class CustomSearchDelegate extends SearchDelegate {
  SendQuery s1 = new SendQuery();

  final prouctsSuggestions =["aookies","milk","juice","chocolate","apple","iceCream","tatyto","24 Pack Coke","white Chocolate"];
  final recentSearchedProducts =["milk","apple","tatyto","24 Pack Coke","white Chocolate"];


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
    var returnedData= s1.getData("https://ca2-app.azurewebsites.net/api/values/searchProduct/"+query);

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
        future: returnedData, builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return  Container();
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
                      children: <Widget>[new Container(child: new Text("Product Name " + product1.name +
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

    final suggestionList = query.isEmpty?recentSearchedProducts:prouctsSuggestions.where((p)=>p.startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context,i)=>ListTile(
      onTap: (){showResults(context);},
      leading: Icon(Icons.search),

      title: RichText(text: TextSpan(
        text: suggestionList[i].substring(0,query.length),
      style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
      children: [TextSpan(text: suggestionList[i].substring(query.length),
      style: TextStyle(color: Colors.grey))])
      ),),
      itemCount: suggestionList.length ,
    );


  }
}




