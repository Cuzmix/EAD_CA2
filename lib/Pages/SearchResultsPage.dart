import 'package:flutter/material.dart';
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:shopping_app_v1/Util/Querybackend.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_v1/Util/Localization.dart';


class CustomSearch extends SearchDelegate {
  SendQuery s1 = new SendQuery();
  final productsSuggestions =["cookies","milk","juice","chocolate","apple","iceCream","tayto","24 Pack Coke","white chocolate"];
  final recentSearchedProducts =["milk","apple","cookies","juice"];

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

  Future<String> createPost(int id,int decrementValue) async {
    try {
      await http.post(Uri.encodeFull("https://ca2-app.azurewebsites.net/api/values/purchaseItem/"+id.toString()+"/"+decrementValue.toString()), headers: {"Accept": "applicatin/json"});
      return "success!";
    }catch(e){
      print (e);
    }
  }


  @override
  Widget buildResults(BuildContext context) {
    var productName = DemoLocalizations.of(context).productName;
    var productPrice = DemoLocalizations.of(context).productPrice;
    var quantity  = DemoLocalizations.of(context).quantity;
    var enterQuantity = DemoLocalizations.of(context).enterQuantity;
    var returnedData= s1.getData("https://ca2-app.azurewebsites.net/api/values/searchProduct/"+query);
 //   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

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
            List <TextEditingController> _textValueController = new  List(products.length);
            for(var i = 0; i <products.length;i++ )
            {
              _textValueController[i] = new TextEditingController();
            }
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
                          child: new Text(productName.toString() +" "+ product1.name + "\n"+productPrice+" : €" + product1.price.toString() + "\n"+quantity+" : " + product1.quantity.toString()),
                        ),

                        new Container(child:new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new TextFormField(
                              controller: _textValueController[i],
                              decoration: new InputDecoration(labelText: enterQuantity,contentPadding: const EdgeInsets.all(20.0)),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (term) =>  (createPost(product1.id,int.parse(_textValueController[i].text))),
                            ),
                          ],
                        ),

                        ),
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
    final suggestionList = query.isEmpty?recentSearchedProducts:productsSuggestions.where((p)=>p.contains(query)).toList();
    return ListView.builder(itemBuilder: (context,i)=>ListTile(
      onTap: () => query = suggestionList[i].toString(),
      leading: Icon(Icons.search),

      title: RichText(text: TextSpan(text: suggestionList[i].substring(0,query.length), style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold), children: [TextSpan(text: suggestionList[i].substring(query.length), style: TextStyle(color: Colors.grey))])
      ),
    ),
      itemCount: suggestionList.length ,
    );


  }
}




