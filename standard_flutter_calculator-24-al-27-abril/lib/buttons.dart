import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final buttonText;
  final buttonTapped;
  final textSize;
  final textWeight;
  final iconDel;

  const MyButton({
    this.color,
    this.textColor,
    this.buttonText,
    this.buttonTapped,
    this.textSize,
    this.textWeight,
    this.iconDel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                  fontWeight: textWeight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
