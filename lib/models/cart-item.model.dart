import 'package:flutter_training_27nov/models/product.model.dart';

class CartItem {
  final String productId;
  final String productName;
  final int price;
  int quantity;
  final String imagePath;

  CartItem({
    required this.productId,
    required this.price,
    required this.quantity,
    required this.imagePath,
    required this.productName,
  });

  static CartItem fromProduct({required Product product}) {
    return CartItem(
        productId: product.id,
        productName: product.name,
        price: product.price,
        quantity: product.quantity,
        imagePath: product.imagePath);
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'price': price,
      'quantity': quantity,
      'imagePath': imagePath,
      'productName': productName,
    };
  }

  static CartItem fromMap(Map<String, dynamic> data) {
    return CartItem(
        productId: data['productId'],
        price: data['price'],
        quantity: data['quantity'],
        imagePath: data['imagePath'],
        productName: data['productName']);
  }
}
