import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart_item.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  static String routeName = "/cart";

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);

    Widget _listviewBuild(Map<String, CartItem> items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (c, i) {
            var it = items.values.toList()[i];
            return CartItemWidget(item: it);
          },
        );

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(width: 10),
                  Spacer(),
                  Chip(
                    label: Text(
                      "O total é ${provider.itemsCartTotal}",
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.bodyText1!.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: FittedBox(
                      child: Text(
                        "PEDIR AGORA!",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: _listviewBuild(provider.items),
          ),
        ],
      ),
    );
  }
}
