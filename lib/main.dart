import 'package:flutter/material.dart';
import 'package:math_game/start_game.dart';
void main() {
  runApp(
    const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Math game",
        home: SafeArea(child: StartGame())),
  );
}
