import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/models/cart_item.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  const CartItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);

    void _onDismiss(_) => provider.removeItem(item.id);

    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: _onDismiss,
      key: ValueKey(item.id),
      background: Container(
        padding: EdgeInsets.all(20),
        color: Theme.of(context).accentColor,
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  child: Text("R\$:${item.price}"),
                ),
              ),
            ),
            title: Text(item.title),
            subtitle: Text("Total R\$:${item.getTotal()}"),
            trailing: Text("${item.quantity} x"),
          ),
        ),
      ),
    );
  }
}
