import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      centerTitle: false,
      title: Text('Instagram',
          style: TextStyle(
              fontSize: 32, fontFamily: "Billabong", color: Colors.black)),
      actions: [
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.send_outlined,
              color: Colors.black,
            )),
      ],
    );
  }
}
