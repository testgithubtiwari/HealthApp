import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  int _cartItemCount = 0;

  int get cartItemCount => _cartItemCount;

  void updateCartItemCount(int itemCount) {
    _cartItemCount = itemCount;
    notifyListeners();
  }
}
