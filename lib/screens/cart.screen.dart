import 'package:flutter/material.dart';
import 'package:flutter_training_27nov/screens/home.screen.dart';
import 'package:flutter_training_27nov/widgets/custom-button.widget.dart';
import 'package:get/get.dart';

import '../controller/cart.controller.dart';
import '../models/cart-item.model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(cartController.cartItemList.length);

    return GetBuilder(
      builder: (CartController cartController) {
        return Padding(
          padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    'My Cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                  Icon(Icons.edit),
                ],
              ),
              SizedBox(height: 20),
              ...List.generate(
                cartController.cartItemList.length,
                (index) => CartItemContainer(
                  cartItem: cartController.cartItemList[index],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Discount'),
                  Spacer(),
                  Text((cartController.discount / 100).toStringAsFixed(2))
                ],
              ),
              Row(
                children: [
                  Text('Total'),
                  Spacer(),
                  Text((cartController.getTotal / 100).toStringAsFixed(2))
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomButton(label: 'Buy now', onPressed: () {}),
              )
            ],
          ),
        );
      },
    );
  }
}

class CartItemContainer extends StatelessWidget {
  final CartItem cartItem;

  CartItemContainer({required this.cartItem});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            child: Image.asset(
              cartItem.product.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.product.name),
                Text('RM ${cartItem.product.price / 100}'),
              ],
            ),
          ),
          Material(
            clipBehavior: Clip.hardEdge,
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              child: Row(
                children: [
                  InkWell(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 3, right: 3),
                      child: Text('  -  ', style: customTextStyle),
                    ),
                    onTap: () {
                      cartItem.product.quantity--;
                      cartController.updateData();
                    },
                  ),
                  Container(
                    width: 40,
                    child: Center(
                        child: Text(cartItem.product.quantity.toString(),
                            style: customTextStyle)),
                  ),
                  InkWell(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 3, right: 3),
                      child: Text('  +  ', style: customTextStyle),
                    ),
                    onTap: () {
                      cartItem.product.quantity++;
                      cartController.updateData();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle get customTextStyle {
    return TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600);
  }
}
