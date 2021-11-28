import 'package:flutter/material.dart';

import '../models/product.model.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  ProductScreen({required this.product});

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
                      '\$ ${product.price / 100}',
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
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Add to cart'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
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

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final EdgeInsetsGeometry padding;
  final Color? iconColor;
  final Function onTap;

  CustomIconButton({
    required this.iconData,
    required this.padding,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        clipBehavior: Clip.hardEdge,
        color: Colors.white54,
        child: InkWell(
          child: Padding(
            padding: padding,
            child: Container(
              width: 37,
              child: Icon(
                iconData,
                size: 16,
                color: iconColor ?? Colors.grey.shade800,
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
