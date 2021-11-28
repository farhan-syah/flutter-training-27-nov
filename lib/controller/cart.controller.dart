import 'package:get/get.dart';

import '../models/cart-item.model.dart';
import '../models/product.model.dart';
import '../services/api.service.dart';

// final CartController cartController = CartController.instance;

class CartController extends GetxController {
  int discount = 0;

  CartController();

  List<CartItem> cartItemList = [];

  int get getTotal {
    int total = 0;
    cartItemList.forEach((cartItem) {
      total += cartItem.product.price * cartItem.product.quantity;
    });

    return total;
  }

  addProduct(Product product) {
    final index = cartItemList
        .indexWhere((cartItem) => cartItem.product.id == product.id);

    if (index == -1) {
      product.quantity = 1;
      cartItemList.add(
        CartItem(product: product),
      );
    } else {
      final cartItem = cartItemList[index];
      cartItem.product.quantity++;
    }

    updateData();
  }

  updateData() async {
    await addCartDataToFirebase(this);
    update();
  }

  Map<String, dynamic> toMap() {
    return {
      'discount': discount,
      'total': getTotal,
      'cartItemList': cartItemList.map((e) => e.product.toMap()).toList()
    };
  }
}
