import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/product_item.dart';

enum FilterProductOptions {
  FAVORITES,
  ALL,
}

class ProductsOverviewPage extends StatefulWidget {
  @override
  _ProductsOverviewPageState createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);

    Widget _gridViewBuilder() {
      final products =
          _showOnlyFavorites ? provider.favorites : provider.products;
      return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(),
        ),
      );
    }

    void _selectPopupMenuItem(FilterProductOptions selectedValue) {
      setState(() {
        switch (selectedValue) {
          case FilterProductOptions.FAVORITES:
            _showOnlyFavorites = true;
            break;
          case FilterProductOptions.ALL:
            _showOnlyFavorites = false;
            break;
          default:
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Sh0pZ"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: _selectPopupMenuItem,
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favoritos'),
                value: FilterProductOptions.FAVORITES,
              ),
              PopupMenuItem(
                child: Text('Mostrar todos'),
                value: FilterProductOptions.ALL,
              ),
            ],
          )
        ],
      ),
      body: _gridViewBuilder(),
    );
  }
}
