import 'dart:async';
import 'dart:convert'; //used to convert json response
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_v1/Model/Product.dart';
import 'package:flutter/src/material/list_tile.dart';

class SnackBarw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    void showSnackBar() {
      print("Show Snackbar here !");
      final snackBar = new SnackBar(content: new Text("This is a SnackBar"), duration: new Duration(seconds: 3), backgroundColor: Colors.green,
        action: new SnackBarAction(label: 'Ok', onPressed: () {
          print('press Ok on SnackBar');
        }),
      );
      //How to display Snackbar ?
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
}