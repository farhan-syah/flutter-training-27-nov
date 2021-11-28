import 'package:flutter/material.dart';
import 'package:flutter_training_27nov/screens/login.screen.dart';
import 'package:flutter_training_27nov/services/api.service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              await logout();
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
