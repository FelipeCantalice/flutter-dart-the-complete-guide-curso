import 'package:shop_app/models/product.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;
  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });

  static CartItem fromProduct(Product product) {
    return CartItem(
      id: product.id,
      title: product.title,
      quantity: 1,
      price: product.price,
    );
  }

  void incrementQuantity({int quantity = 1}) {
    this.quantity += quantity;
  }

  void decrementQuantity({int quantity = 1}) {
    if (quantity > 0) {
      this.quantity -= quantity;
    }
  }

  void clearQuantity() {
    this.quantity = 0;
  }

  double getTotal() => (this.quantity * this.price);
}
