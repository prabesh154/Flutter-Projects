import 'package:flutter/material.dart';

class AddStoryProfileComponent extends StatelessWidget {
  const AddStoryProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 232, 197, 209),
                radius: 45),
            Positioned(
              top: 65,
              left: 65,
              child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    iconSize: 20,
                    color: const Color.fromARGB(255, 16, 5, 5),
                  )),
            )
          ],
        ),
      ],
    );
  }
}
