import 'package:flutter/material.dart';
import 'package:instaclone/components/custom_appbar.dart';
import 'package:instaclone/components/home/post_component.dart';
import 'package:instaclone/test_data.dart';
import '../../components/add_story_component.dart';
import '../../components/stories_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomAppBar(
          key: Key('appbarKey'),
        ),
        SliverToBoxAdapter(
          key: const Key(
              'sliverboxadapter_stories'), // Unique key for stories section
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: storyList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 90,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: index == 0
                      ? const AddStoryComponent()
                      : StoryComponent(
                          story: storyList[index],
                        ),
                );
              },
            ),
          ),
        ),
        SliverList(
          key: const Key('sliverlist_posts'), // Unique key for posts list
          delegate: SliverChildBuilderDelegate((context, index) {
            return PostComponent(post: postList[index]);
          }, childCount: postList.length),
        ),
      ],
    );
  }
}
