import 'package:flutter/material.dart';
import 'dart:math';

final randomixer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomixer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/dice-images/dice-$currentDiceRoll.png', width: 200),
        const SizedBox(
          height: 30,
        ),
        TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              // padding: const EdgeInsets.all(8)
              // textStyle: const TextStyle(fontSize: 28)
            ),
            child: const Text(
              'Roll Dice',
              style: TextStyle(fontSize: 30),
            ))
      ],
    );
  }
}
