import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/chair.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 530,
                ),
                Text(
                  'Modern Furniture',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 80, top: 15),
                  child: Text(
                    'Our products combine functional utility with elegance, keeping in view the efficient use of floor space.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
          backgroundColor: Colors.grey.shade700,
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () {},
        ),
      ),
    );
  }
}
