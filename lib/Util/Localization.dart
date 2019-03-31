import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl_translation/extract_messages.dart';
import 'package:intl_translation/generate_localized.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';
import 'package:shopping_app_v1/Pages/landingPage.dart';


class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Title': 'Shopping App',
      'Start Shopping': 'Start Shopping',
      'Product Name': 'Product Name',
      'Product Price': 'Product Price',
      'Quantity': 'Quantity',
      'Enter Quantity': 'Enter Quantity',
      'Lets Shop': 'Lets Shop',
      'Tap to Start': 'Tap to Start ',
    },


    'es': {
      'Title': 'Aplicación de compras',
      'Start Shopping': 'Empieza a comprar',
      'Product Name': 'Nombre del producto',
      'Product Price': 'Precio del producto',
      'Quantity': 'Cantidad',
      'Enter Quantity': 'Ingrese la cantidad',
      'Lets Shop': 'Vamos a la tienda',
      'Tap to Start': 'Toque para iniciar',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['Title'];
  }


  String get startShopping {
    return _localizedValues[locale.languageCode]['Start Shopping'];
  }

    String get productName {
    return _localizedValues[locale.languageCode]['Product Name'];
  }


  String get productPrice {
    return _localizedValues[locale.languageCode]['Product Price'];
  }

    String get quantity {
    return _localizedValues[locale.languageCode]['Quantity'];
  }


  String get enterQuantity {
    return _localizedValues[locale.languageCode]['Enter Quantity'];
  }

    String get letsShop {
    return _localizedValues[locale.languageCode]['Lets Shop'];
  }

  String get tapToStart {
    return _localizedValues[locale.languageCode]['Tap to Start'];
  }

}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}



class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => DemoLocalizations.of(context).title, localizationsDelegates: [const DemoLocalizationsDelegate(), GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate,],
      supportedLocales: [const Locale('en', ''), const Locale('es', ''),],
      home: ShopingAppPage(),
    );
  }
}

/*
class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(DemoLocalizations.of(context).title, style: new TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.info, color: Colors.white,),
              onPressed: (){})
        ],
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text(DemoLocalizations.of(context).startShopping),
            onPressed: () =>
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new ProductList()))),
      ),
    );
  }
}
*/