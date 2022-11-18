import 'package:flutter/material.dart';
import 'package:math_game/constant.dart';

class ResultMessage extends StatelessWidget {
  final VoidCallback onTap;
  // ignore: prefer_typing_uninitialized_variables
  final iconResult;
  final String resultMessage;
  const ResultMessage(
      {super.key,
      required this.onTap,
      required this.iconResult,
      required this.resultMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              resultMessage,
              style: mainWhiteStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(iconResult, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
