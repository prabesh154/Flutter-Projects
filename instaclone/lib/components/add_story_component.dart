import 'package:flutter/material.dart';

class AddStoryComponent extends StatelessWidget {
  const AddStoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 232, 197, 209),
                radius: 32),
            Positioned(
              top: 42,
              left: 40,
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
        const Spacer(),
        const Text(
          "Your Story",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
