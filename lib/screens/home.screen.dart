import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classroom App'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Center(
        child: Text('Test Text'),
      ),
    );
  }
}
