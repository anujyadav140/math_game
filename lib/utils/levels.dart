import 'package:flutter/material.dart';
import 'package:math_game/constant.dart';

// ignore: must_be_immutable
class Levels extends StatelessWidget {
  final levelNumber;
  final levelUpped;
  var levelColor = Colors.deepPurple[300];
  Levels({super.key, required this.levelNumber, required this.levelUpped});

  @override
  Widget build(BuildContext context) {
    if (levelUpped) {
      levelColor = Colors.deepPurple;
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 0,
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: levelColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            levelNumber,
            style: mainWhiteStyle,
          ),
        ),
      ),
    );
  }
}
