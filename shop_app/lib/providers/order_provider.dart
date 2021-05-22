import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/cart_item.dart';
import 'package:shop_app/models/order_item.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => [..._orders];

  void addOrders(List<CartItem> cartProducts) {
    var total = 0.00;
    cartProducts.forEach((c) {
      total += c.getTotal().roundToDouble();
    });
    _orders.insert(
      0,
      OrderModel(
        id: DateTime.now().toString(),
        products: cartProducts,
        amount: total,
        dateTime: DateTime.now(),
      ),
    );
  }
}
