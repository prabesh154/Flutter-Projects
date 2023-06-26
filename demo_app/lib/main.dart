import 'package:flutter/material.dart';
import 'gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: const [Colors.black, Colors.white],
        ),
      ),
    ),
  );
}

//         body: GradientContainer(
//           Color.fromARGB(44, 198, 141, 65),
//           Color.fromARGB(44, 198, 141, 65),
//         ),
//       ),
//     ),
//   );
// }