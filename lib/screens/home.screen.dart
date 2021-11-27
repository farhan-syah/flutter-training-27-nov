import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Icon(Icons.shopping_bag),
                SizedBox(width: 10),
                Stack(
                  children: [
                    Icon(Icons.notifications),
                    Padding(
                      padding: EdgeInsets.only(left: 13, top: 5),
                      child: ClipOval(
                        child: Container(
                          width: 7,
                          height: 7,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: Text('Test Text'),
      ),
    );
  }
}
