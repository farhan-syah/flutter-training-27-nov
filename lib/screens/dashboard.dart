import 'package:flutter/material.dart';
import 'package:flutter_training_27nov/screens/cart.screen.dart';
import 'package:flutter_training_27nov/screens/favorites.screen.dart';
import 'package:flutter_training_27nov/screens/home.screen.dart';
import 'package:flutter_training_27nov/screens/profile.screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentScreenIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    FavoritesScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Home'),
        ],
        currentIndex: currentScreenIndex,
        selectedItemColor: Colors.grey.shade800,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        onTap: (index) {
          currentScreenIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
