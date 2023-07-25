import 'package:flutter/material.dart';
import 'package:myapp/consts/consts.dart';

// Widget homeContent({required String userName}) {
//   return Scaffold(
//     body: Container(
//       decoration: const BoxDecoration(
//         shape: BoxShape.rectangle,
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.topRight,
//           colors: [
//             Color.fromARGB(95, 226, 46, 145),
//             Color.fromARGB(255, 232, 74, 62)
//           ],
//         ),
//       ),
//       child: Center(
//         child: Text(
//           'Hello $userName', // Use the userName received from the parameter
//           style: TextStyle(fontFamily: billabong, fontSize: 50),
//         ),
//       ),
//     ),
//   );
// }

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(95, 226, 46, 145),
                Color.fromARGB(255, 232, 74, 62)
              ]),
        ),
        child: Center(
          child: Text(
            'Hello $userName',
            style: const TextStyle(fontFamily: billabong, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
