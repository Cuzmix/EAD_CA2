import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';
import 'package:shopping_app_v1/Util/Localization.dart';


Widget makeTestableWidget({Widget child}){
  return MaterialApp(

    home:ProductList(),
  );
}

void main() {
  testWidgets('testingLandingPage', (WidgetTester tester) async {

    await tester.pumpWidget(new Demo());
    expect(find.text("Lets Shop"),findsOneWidget);

    expect(find.text("Lets Shops"),findsNothing);
    expect(find.text("Tap to Starts"),findsNothing);
    expect(find.byIcon(Icons.search),findsNothing);

    expect(find.widgetWithText(Scaffold, ('testing')), findsNothing);
    expect(find.text('testing'),findsNothing);
     expect(find.text('1'), findsNothing);

  });
}

