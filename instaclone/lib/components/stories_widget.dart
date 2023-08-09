import 'package:flutter/material.dart';

import '../models/stories.dart';

class StoryComponent extends StatelessWidget {
  const StoryComponent({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow.shade800,
                ],
              ),
              border: Border.all(width: 2, color: Colors.transparent),
              borderRadius: BorderRadius.circular(50)),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 32,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 238, 237, 237),
              backgroundImage: NetworkImage(story.postedBy.image),
              radius: 30,
            ),
          ),
        ),
        const Spacer(),
        const Text(
          "username",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Color.fromARGB(255, 205, 80, 80),
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
