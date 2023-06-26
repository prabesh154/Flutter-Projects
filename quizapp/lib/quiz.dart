import 'package:flutter/material.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  var activa


  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Color.fromRGBO(78, 131, 210, 1)],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: const StartScreen()),
      ),
    );
  }
}
