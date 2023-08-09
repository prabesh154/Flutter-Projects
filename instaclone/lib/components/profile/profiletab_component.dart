import 'package:flutter/material.dart';
import '../../models/post.dart';

class ProfileTabComponent extends StatelessWidget {
  const ProfileTabComponent({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Image.network(
                'https://i.pinimg.com/originals/52/13/d0/5213d0ba3a0b84aa83d55ec157cf65e8.jpg');
            // return Image.network(post.imageUrl);
          },
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            // return Image.network(post.imageUrl);
            return Image.network(
                'https://i.pinimg.com/originals/52/13/d0/5213d0ba3a0b84aa83d55ec157cf65e8.jpg');
          },
        ),
      ],
    );
  }
}
