import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  CustomButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(label),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
      ),
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
