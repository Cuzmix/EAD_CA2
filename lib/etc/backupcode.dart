/*
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';

void main() => runApp(shopingApp());

class shopingApp extends StatelessWidget {
  // shopingApp({Key key}) : super(key: key);
  //responsible for rendering the object in the UI

  @override
  Widget build(BuildContext context) {
    // responsible for the object to render onto the screen
    // TODO: implement build

    return MaterialApp(
        title: "Test1234",
        home: new Scaffold(
          // this provides the bases such as white screen the nav bar etc..

//---------------------
          /*       drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the Drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text("Manny"),
                  accountEmail: new Text("Manny@Gmail.com"),
                  currentAccountPicture: new GestureDetector(
                    onTap: () => print("This the main current"),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(
                          "https://dumielauxepices.net/sites/default/files/nintendo-clipart-mario-mushroom-697789-1653313.png"),
                      backgroundColor: Colors.greenAccent,
                    ),
                  ),
                  decoration: new BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"))),
                ),
                ListTile(
                  title: Text('Languages'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                new Divider(),
                ListTile(
                  title: Text('English'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
*/
//-------------------------------------
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
                  onPressed: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new ShoppingCart())))
            ],
          ),

          body: ProductList(),//calling the page to load
        ));
  }
}


class ProductList extends StatelessWidget {
  @override
  //QuantityWidget createState()=> QuantityWidget();




  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 1,
      itemBuilder: (context, rowNumber) {
        return new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new Image.network("https://www.abelandcole.co.uk/media/746_17285_z.jpg"),
              new Container(height: 7.5),
              new Text("Bottle of milk"),
              new Text("Qty : "),
              new QuantityWidget(),
              new AddtoCartButton(),
              new Divider(
                color: Colors.red,
              )
            ],
          ),
        );
      }, //function that takes a function and an integer and and context returns it
    );
  }
}

///button
class AddtoCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      //padding: const EdgeInsets.all(1.0),
      textColor: Colors.white,
      color: Colors.blue,
      onPressed: () {},
      child: new Text("Add To Cart"),
    );
  }
}

//Qty increment
class QuantityWidget extends StatelessWidget {
  int _n = 0;

  void add() {
    //setState(() {
    //_n++;
    // });
  }

  void minus() {
    //   setState(() {
    //   if (_n != 0)
    //      _n--;
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new FloatingActionButton(
          onPressed: add,
          child: new Icon(
            Icons.add,
            color: Colors.black,
          ),

          backgroundColor: Colors.white,
        ),
        new Text('$_n', style: new TextStyle(fontSize: 60.0)),
        new FloatingActionButton(
          onPressed: minus,
          child: new Icon(const IconData(0xe15b, fontFamily: 'MaterialIcons'),
              color: Colors.black),
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}













new GridView.count(
          crossAxisCount: 2,
          children: new List<Widget>.generate(productList == null ? 0 : productList.length, (index) {
              return new GridTile(
                child: new Card(
                    color: Colors.blue.shade200,
                    child: new Center(
                      child: new Text('tile $index name is :'),
                    )),
              );
            },
          ),
        ),








ListView.separated(
          itemCount: products.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (BuildContext context, int i) {
            Product product1 = products[i];
            return ListTile(
              title: new Text(product1.name+" "+product1.price.toString()),

              leading: CircleAvatar(
                child: Text("MK"),
              ),
            );
          }),


-----------------------------------------------------------------------------------------------
 body: new GridView.count(

        crossAxisCount: 2,
        children: new List<Widget>.generate(products.length, (i) {
          Product product1 = products[i];
          return new GridTile(
            child: new Card(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[

               Container(
                child: new Center(
                  child: new Text("Product Name "+product1.name +"\nProduct Price : "
                      "€"+product1.price.toString()+"\nQuantity: "+product1.quantity.toString()),


                ),


                ),
                    Container(
                      child : new Align(
                        alignment :FractionalOffset.bottomCenter,
                        child :new OutlineButton(
                            child: new Text("Add to Cart"),
                            onPressed: null,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                        )
                    )
                    )
                  ],
          )
            ),
          );
        },
        ),
      ),


      -----------------------------------------------------------------------------------
      import 'package:flutter/material.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/widgets/basic.dart';





class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // action for search bar
    return [IconButton(icon: Icon(Icons.clear),onPressed: (){})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leadind icon
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show results based iof selction

    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show suggestions

   // final suggestionList = query.isEmpty?null
    return null;
  }



}


------------------------------------------------------
import 'dart:async';
import 'dart:convert'; //used to convert json response
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:shopping_app_v1/Util/ErrorDialog.dart';

class SendQuery extends StatefulWidget {
  @override
  State createState() => SendQueryState();
}

class SendQueryState extends State<SendQuery> {
  @override
  Widget build(BuildContext context) {
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

        return getData;
      }catch(e){
        ErrorDialog();
        print (e);
      }
    }
  }
}

*/