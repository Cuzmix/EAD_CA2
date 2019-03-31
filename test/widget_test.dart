import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_v1/main.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';
import 'package:shopping_app_v1/Pages/landingPage.dart';

void main() {
  testWidgets('Test Start Widget', (WidgetTester tester) async {
    await tester.pumpWidget(new ShoppingAppPage());

    // Verify that our counter starts at 0.
    //expect(find.widgetWithText(Scaffold, ('testing')), findsOneWidget);
   // expect(find.widgetWithText(Column, "Tap to start!"), findsOneWidget);
    //expect(find.text('testing'),findsOneWidget);
   // expect(find.text('1'), findsNothing);
  });
}