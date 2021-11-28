import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_training_27nov/controller/cart.controller.dart';
import 'package:get/get.dart';

import '../controller/user.controller.dart';
import '../models/product.model.dart';
import '../models/user.model.dart';

// final api = Api.instance();
final firestore = FirebaseFirestore.instance;
//
// class Api {
//   Api();
//   static instance() => Api();
//
//   Future<List<Product>> getProducts() async {
//     final QuerySnapshot querySnapshot =
//         await firestore.collection('products').get();
//
//     // querySnapshot.docs.forEach((element) {
//     //   print(element.data());
//     // });
//
//     List<Product> products = querySnapshot.docs
//         .map((e) =>
//             Product.fromMap({'id': e.id, ...e.data() as Map<String, dynamic>}))
//         .toList();
//     //
//     // print(products);
//     return products;
//     // List<Product> products =
//     //     querySnapshot.docs.map((e) => Product.fromMap(e.data())
//   }
// }

Future<List<Product>> getProducts() async {
  final QuerySnapshot querySnapshot =
      await firestore.collection('products').get();

  // querySnapshot.docs.forEach((element) {
  //   print(element.data());
  // });

  List<Product> products = querySnapshot.docs
      .map((e) =>
          Product.fromMap({'id': e.id, ...e.data() as Map<String, dynamic>}))
      .toList();
  //
  // print(products);
  return products;
  // List<Product> products =
  //     querySnapshot.docs.map((e) => Product.fromMap(e.data())
}

addCartDataToFirebase(CartController cartController) {
  final MyUser? user = Get.find<UserController>().user;

  if (user != null) {
    print(cartController.toMap());

    firestore.collection('cart').doc(user.id).set(cartController.toMap());
  }
}

getCartItems() {}
