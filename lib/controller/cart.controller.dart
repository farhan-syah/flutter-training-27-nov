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
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  addProduct(Product product) {
    final index =
        cartItemList.indexWhere((cartItem) => cartItem.productId == product.id);

    if (index == -1) {
      product.quantity = 1;
      cartItemList.add(
        CartItem.fromProduct(product: product),
      );
    } else {
      final cartItem = cartItemList[index];
      cartItem.quantity++;
    }

    updateData();
  }

  updateData() async {
    await addCartDataToFirebase(this);
    update();
  }

  retreiveData() async {
    cartItemList = await getCartItems();
    update();
  }

  Map<String, dynamic> toMap() {
    return {
      'discount': discount,
      'total': getTotal,
      'cartItemList': cartItemList.map((e) => e.toMap()).toList()
    };
  }
}
