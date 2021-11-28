import 'package:flutter/material.dart';
import 'package:flutter_training_27nov/screens/cart.screen.dart';
import 'package:get/get.dart';

import '../controller/cart.controller.dart';
import '../models/cart-item.model.dart';
import '../models/product.model.dart';
import '../widgets/custom-button.widget.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  ProductScreen({required this.product});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CustomIconButton(
          iconData: Icons.arrow_back_ios,
          padding: EdgeInsets.only(left: 5),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CustomIconButton(
            iconData: Icons.favorite,
            padding: EdgeInsets.zero,
            iconColor: Colors.red.shade600,
            onTap: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 130,
                color: Colors.white,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Container(
                padding: EdgeInsets.all(20),
                height: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(100),
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'RM ${product.price / 100}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                        Text(
                          product.rating.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '(${product.reviewCount} Reviews)',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      product.description,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    CustomButton(
                      label: 'Add to cart',
                      onPressed: () {
                        // print(cartController.cartItemList);
                        final index = cartController.cartItemList.indexWhere(
                            (cartItem) => cartItem.product.id == product.id);

                        if (index == -1) {
                          product.quantity = 1;
                          cartController.cartItemList.add(
                            CartItem(product: product),
                          );
                        } else {
                          final cartItem = cartController.cartItemList[index];
                          cartItem.product.quantity++;
                        }

                        // cartController.update();
                        //     if(cartItemList.where((cartItem) => cartItem.product.id == product.id ))
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
