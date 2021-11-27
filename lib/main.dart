import 'package:flutter/material.dart';
import 'package:flutter_training_27nov/screens/home.screen.dart';
import 'package:flutter_training_27nov/screens/splash.screen.dart';

// https://dribbble.com/shots/16914673-Furniture-Mobile-App-Design

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
