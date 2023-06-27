import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
//this to automatically set the values and only after that can be used in build method.
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(55, 234, 223, 223),
          ),
          const SizedBox(height: 80),
          const Text(
            'Lets go for the Quiz Game',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 10),
          //Both METHOD RIGHT.

          // OutlinedButton.icon(
          //   onPressed: () {
          //     startQuiz();
          //   },
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Play the Quiz',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
