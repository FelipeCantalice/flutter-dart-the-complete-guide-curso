import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  static String routeName = "/product/detail";

  const ProductDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idProduct = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
        ),
      ),
    );
  }
}
