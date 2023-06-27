import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The question is ...',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton('hello', () {}),
          AnswerButton('hello', () {}),
          AnswerButton('hello', () {}),
          AnswerButton('hello', () {})
        ],
      ),
    );
  }
}
