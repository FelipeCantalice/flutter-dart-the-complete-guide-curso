import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_details_page.dart';
import 'package:shop_app/screens/products_overview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewPage(),
      routes: {ProductDetailsPage.routeName: (ctx) => ProductDetailsPage()},
    );
  }
}
