import 'package:flutter/material.dart';
import 'package:flutter_training_27nov/screens/home.screen.dart';
import 'package:flutter_training_27nov/screens/splash.screen.dart';
import 'package:get/get.dart';

import 'controller/cart.controller.dart';

// https://dribbble.com/shots/16914673-Furniture-Mobile-App-Design

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade50,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.grey),
        ),
      ),
    );
  }
}
