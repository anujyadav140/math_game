import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game/constant.dart';
import 'package:math_game/utils/levels.dart';
import 'package:math_game/utils/message.dart';
import 'package:math_game/utils/my_button.dart';

class StartGame extends StatefulWidget {
  const StartGame({super.key});

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  int num1 = 1;
  int num2 = 1;

  List levelNum = [
    ['1', false],
    ['2', false],
    ['3', false],
    ['4', false],
    ['5', false],
  ];

  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];

  String userAnswer = '';

  int correctAns = 0;
  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
    if (num1 + num2 == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
                onTap: nextQuestion,
                iconResult: Icons.arrow_forward,
                resultMessage: "Correct!");
          });
      setState(() {
        if (correctAns < 5) {
          levelNum[correctAns][1] = !levelNum[correctAns][1];
        }
      });
      correctAns++;
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
                onTap: retryQuestion,
                iconResult: Icons.rotate_left,
                resultMessage: "Incorrect!");
          });
    }
  }

  Random randomNum = Random();

  void nextQuestion() {
    Navigator.pop(context);

    setState(() {
      userAnswer = '';
    });

    num1 = randomNum.nextInt(10);
    num2 = randomNum.nextInt(10);
  }

  void retryQuestion() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          //level progress 5 levels
          Container(
            height: 110,
            color: Colors.deepPurple[400],
            child: GridView.builder(
              itemCount: levelNum.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemBuilder: (context, index) {
                return Levels(
                  levelNumber: levelNum[index][0],
                  levelUpped: levelNum[index][1],
                );
              },
            ),
          ),
          //question
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$num1 + $num2 = ",
                      style: mainWhiteStyle,
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: mainWhiteStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          //number pad
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: ((context, index) {
                  return MyButton(
                    numPadChild: numberPad[index],
                    clickButton: () => buttonTapped(numberPad[index]),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
