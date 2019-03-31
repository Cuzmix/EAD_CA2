import 'dart:async';
import 'dart:convert'; //used to convert json response
import 'package:http/http.dart' as http;
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:shopping_app_v1/Util/ErrorDialog.dart';

class SendQuery {
  var products = const [];
  Future<List<Product>> getData(String url) async {
    try {
      http.Response response = await http.get(Uri.encodeFull(url), headers: {"Accept": "applicatin/json"});

      List collection = json.decode(response.body);
      return collection.map((json) => new Product.fromJson(json)).toList();

    }catch(e){
      ErrorDialog();
      print (e);
    }
  }
}
