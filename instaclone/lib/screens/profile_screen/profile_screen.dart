// import 'package:flutter/material.dart';
// import 'package:instaclone/components/profile/profile_header.dart';
// import 'package:instaclone/components/profile/profiletab_component.dart';
// import 'package:instaclone/test_data.dart';

// import '../../components/profile/custom_profile_appbar.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return NestedScrollView(
//       headerSliverBuilder: (context, index) {
//         return [
//           const CustomProfileAppBar(),
//           const SliverToBoxAdapter(
//             child: ProfileHeader(),
//           ),
//         ];
//       },
//       body: Column(
//         children: [
//           for (final post in postList) ProfileTabComponent(post: post),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:instaclone/components/profile/profile_header.dart';
import 'package:instaclone/components/profile/profiletab_component.dart';
import 'package:instaclone/test_data.dart';

import '../../components/profile/custom_profile_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, index) {
          return [
            const CustomProfileAppBar(),
            const SliverToBoxAdapter(
              child: ProfileHeader(),
            ),
          ];
        },
        body: ProfileTabComponent(
          post: postList[0],
        ));
  }
}
