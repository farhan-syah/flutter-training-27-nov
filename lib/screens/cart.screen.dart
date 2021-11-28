import 'package:flutter/material.dart';
import 'package:flutter_training_27nov/screens/home.screen.dart';
import 'package:flutter_training_27nov/widgets/custom-button.widget.dart';

import '../controller/cart.controller.dart';
import '../models/cart-item.model.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(cartController.cartItemList.length);
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
  }
}

class CartItemContainer extends StatefulWidget {
  final CartItem cartItem;

  CartItemContainer({required this.cartItem});

  @override
  State<CartItemContainer> createState() => _CartItemContainerState();
}

class _CartItemContainerState extends State<CartItemContainer> {
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
              widget.cartItem.product.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.cartItem.product.name),
                Text('\$ ${widget.cartItem.product.price / 100}'),
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
                      widget.cartItem.product.quantity--;
                      setState(() {});
                    },
                  ),
                  Container(
                    width: 40,
                    child: Center(
                        child: Text(widget.cartItem.product.quantity.toString(),
                            style: customTextStyle)),
                  ),
                  InkWell(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 3, right: 3),
                      child: Text('  +  ', style: customTextStyle),
                    ),
                    onTap: () {
                      widget.cartItem.product.quantity++;
                      setState(() {});
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
