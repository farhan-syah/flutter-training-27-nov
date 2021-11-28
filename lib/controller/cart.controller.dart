import '../models/cart-item.model.dart';

final CartController cartController = CartController.instance;

class CartController {
  static get instance => CartController._private();

  int discount = 0;
  int total = 0;

  CartController._private();

  List<CartItem> cartItemList = [];

  int get getTotal {
    cartItemList.forEach((cartItem) {
      total += cartItem.product.price * cartItem.product.quantity;
    });

    return total;
  }
}
