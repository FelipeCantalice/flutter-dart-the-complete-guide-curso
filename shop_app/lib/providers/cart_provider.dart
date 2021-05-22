import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_item.dart';
import 'package:shop_app/models/product.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemsCount => items.length;

  double get itemsCartTotal {
    double total = 0.00;
    _items.forEach((_, item) {
      total += item.getTotal();
    });
    return total;
  }

  void addItem(Product product) {
    // incrementar a quantidade
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (CartItem existingProduct) {
        existingProduct.incrementQuantity();
        return existingProduct;
      });
      notifyListeners();
      return;
    }
    // adicionar um item para o carrinho
    _items.putIfAbsent(product.id, () => CartItem.fromProduct(product));
    notifyListeners();
  }

  void removeItem(String productId) {
    print(_items);
    _items.remove(productId);
    notifyListeners();
  }

  void clearItems() {
    _items = {};
    notifyListeners();
  }
}
