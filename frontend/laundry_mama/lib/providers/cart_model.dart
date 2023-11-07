import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  int totalQuantity = 6;

  void updateTotalQuantity(int quantity) {
    totalQuantity = quantity;
    notifyListeners();
  }
}
