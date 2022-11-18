import 'package:flutter/material.dart';
import 'package:math_game/constant.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final numPadChild;
  final VoidCallback clickButton;
  var buttonColor = Colors.deepPurple[400];
  MyButton({super.key, this.numPadChild, required this.clickButton});

  @override
  Widget build(BuildContext context) {
    if (numPadChild == 'C') {
      buttonColor = Colors.green;
    } else if (numPadChild == 'DEL') {
      buttonColor = Colors.red;
    } else if (numPadChild == '=') {
      buttonColor = Colors.deepPurple;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: clickButton,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              numPadChild,
              style: mainWhiteStyle,
            ),
          ),
        ),
      ),
    );
  }
}
