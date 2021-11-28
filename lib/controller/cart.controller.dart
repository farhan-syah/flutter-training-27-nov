import 'package:get/get.dart';

import '../models/cart-item.model.dart';

// final CartController cartController = CartController.instance;

class CartController extends GetxController {
  int discount = 0;
  int total = 0;

  CartController();

  List<CartItem> cartItemList = [];

  int get getTotal {
    cartItemList.forEach((cartItem) {
      total += cartItem.product.price * cartItem.product.quantity;
    });

    return total;
  }
}
