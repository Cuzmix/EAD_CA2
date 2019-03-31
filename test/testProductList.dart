// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_v1/main.dart';
import 'package:shopping_app_v1/Pages/ProductsListPage.dart';
import 'package:shopping_app_v1/Pages/landingPage.dart';

void main() {
  testWidgets('testProductList', (WidgetTester tester) async {
    await tester.pumpWidget(new ProductList());
    expect(find.widgetWithText(Scaffold, ('Products Page')), findsOneWidget);
  });
}
