import 'package:flutter/material.dart';
import 'package:instaclone/components/profile/profile_header.dart';
import 'package:instaclone/test_data.dart';

import '../../components/profile/custom_profile_appbar.dart';
import '../../components/profile/profiletab_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const CustomProfileAppBar(),
              const SliverToBoxAdapter(
                child: ProfileHeader(),
              ),
              const SliverAppBar(
                expandedHeight: 50,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                pinned: true,
                flexibleSpace: Column(
                  children: [
                    SizedBox(height: 5),
                    TabBar(
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
                  ],
                ),
              ),
            ];
          },
          body: ProfileTabComponent(
            post: postList[0],
          ),
        ),
      ),
    );
  }
}
