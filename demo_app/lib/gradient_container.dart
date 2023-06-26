//import 'package:demo_app/styled_text.dart';
import 'package:flutter/material.dart';

import 'dice_roller.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.topRight;

//Alternative Approach
class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors, begin: startAlignment, end: endAlignment),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}

// class GradientContainer extends StatelessWidget {
//   const GradientContainer(
//       {super.key, required this.color1, required this.color2});
//   final Color color1;
//   final Color color2;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             colors: [color1, color2], begin: startAlignment, end: endAlignment),
//       ),
//       child: const Center(
//         child: StyledText('Hello World'),
//       ),
//     );
//   }
// }