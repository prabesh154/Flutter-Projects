import 'package:flutter/material.dart';

import '../../models/post.dart';

class ProfileTabComponent extends StatelessWidget {
  const ProfileTabComponent({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category_sharp,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.photo_camera,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // First Tab: Categories
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Adjust the number of columns
                    mainAxisSpacing: 1, // Add vertical space between images
                    crossAxisSpacing: 1, // Add horizontal space between images
                  ),
                  itemCount: 3, // Replace with your actual item count
                  itemBuilder: (context, index) {
                    return Image.network(post.imageUrl);
                  },
                ),
                // Second Tab: Photo Album
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Adjust the number of columns
                    mainAxisSpacing: 1, // Add vertical space between images
                    crossAxisSpacing: 1, // Add horizontal space between images
                  ),
                  itemCount: 3, // Replace with your actual item count
                  itemBuilder: (context, index) {
                    return Image.network(post.imageUrl);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
