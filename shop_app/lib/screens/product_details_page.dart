import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductDetailsPage extends StatelessWidget {
  static String routeName = "/product/detail";

  const ProductDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idProduct = ModalRoute.of(context)?.settings.arguments as String;

    final provider = Provider.of<ProductsProvider>(context, listen: false);
    Product product = provider.findById(idProduct);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
        ),
      ),
    );
  }
}
