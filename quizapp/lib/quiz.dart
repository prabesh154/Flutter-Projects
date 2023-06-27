import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget activeScreen = const StartScreen(switchScreen);
  //switchScreen not parenthesis because it will execute. here only provides pointer.

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          //constructor functions.
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Color.fromRGBO(78, 131, 210, 1)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: activeScreen,
      ),
    ));
  }
}
