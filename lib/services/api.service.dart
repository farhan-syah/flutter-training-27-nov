import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_training_27nov/controller/cart.controller.dart';
import 'package:get/get.dart';

import '../controller/user.controller.dart';
import '../models/cart-item.model.dart';
import '../models/product.model.dart';
import '../models/user.model.dart';

// final api = Api.instance();
final firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
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
  final User? user = Get.find<UserController>().user;
  if (user != null) {
    print(cartController.toMap());

    firestore.collection('cart').doc(user.uid).set(cartController.toMap());
  }
}

Future<List<CartItem>> getCartItems() async {
  final User? user = Get.find<UserController>().user;
  List<CartItem> carItemList = [];
  if (user != null) {
    final data = await firestore.doc('cart/${user.uid}').get();
    if (data.exists) {
      carItemList = (data.data()!['cartItemList'] as List)
          .map((e) => CartItem.fromMap(e))
          .toList();
    }
  }
  // print(carItemList.length);
  return carItemList;
}

Future<bool> login({required String email, required String password}) async {
  try {
    UserCredential user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (user.user != null) {
      print(user.user?.uid);
      Get.find<UserController>().user = user.user;
      return true;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

logout() async {
  await auth.signOut();
  Get.find<UserController>().user = null;
}
