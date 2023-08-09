import 'package:flutter/material.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      centerTitle: false,
      elevation: 0,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Icon(
              Icons.https_outlined,
              color: Colors.black,
              size: 18,
            ),
          ),
          Text(
            'prabesh',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dehaze_outlined,
              color: Colors.black,
            ))
      ],
    );
  }
}
