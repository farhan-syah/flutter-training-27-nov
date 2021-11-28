import 'package:flutter/material.dart';
import 'package:flutter_training_27nov/screens/product.screen.dart';
import 'package:flutter_training_27nov/services/api.service.dart';
import 'package:get/get.dart';

import '../controller/cart.controller.dart';
import '../models/product.model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentCategoryIndex = 0;

  final updateData = Get.find<CartController>().retreiveData();

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              'Find modern\nfurniture for you',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                (index) => Label(
                  label: categories[index],
                  active: currentCategoryIndex == index,
                  onTap: () {
                    currentCategoryIndex = index;
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          FutureBuilder<List<Product>>(
              future: getProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Product> products = snapshot.data!;

                  return SingleChildScrollView(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        products.length,
                        (index) => ProductContainer(
                          product: products[index],
                        ),
                      ),
                    ),
                  );
                } else
                  return Container();
              }),
          // ElevatedButton(
          //     onPressed: () {
          //       // getProducts();
          //       getCartItems();
          //     },
          //     child: Text('Test Api'))
        ],
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String label;
  final bool active;
  final Function onTap;
  Label({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        clipBehavior: Clip.hardEdge,
        color: active ? Colors.black : Colors.grey.shade50,
        child: InkWell(
          child: Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border:
                  Border.all(color: active ? Colors.transparent : Colors.grey),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(color: active ? Colors.white : Colors.grey),
              ),
            ),
          ),
          onTap: () {
            onTap();
          },
        ),
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  final Product product;

  ProductContainer({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        child: Container(
          width: 210,
          height: 270,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(product.imagePath),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15, right: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white70),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 16,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade50.withAlpha(150),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 7, right: 7),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade700,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'NEW',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade900),
                      ),
                      Row(
                        children: [
                          Text(
                            'RM ${product.price / 100} ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              color: Colors.grey,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(product: product),
            ),
          );
        },
      ),
    );
  }
}

List<String> categories = [
  'Chair',
  'Sofa',
  'Table',
  'Lamp',
  'Kitchen',
  'Office'
];

// List<Product> products = [
//   Product(
//       id: "1",
//       name: 'Stylish Chair',
//       description: 'Recliners and living room seating',
//       price: 15099,
//       isNew: true,
//       imagePath: 'assets/images/chair.jpg',
//       rating: 4.8,
//       reviewCount: 347),
//   Product(
//       id: "2",
//       name: 'Stylish Chair 2',
//       description: 'Recliners and living room seating',
//       price: 15099,
//       isNew: true,
//       imagePath: 'assets/images/chair2.jpg',
//       rating: 4.9,
//       reviewCount: 312),
// ];
