import 'package:flutter/material.dart';
import 'package:instaclone/components/profile/addstory_profile_component.dart';
import 'package:instaclone/components/profile/profile_labelcount_widget.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  bool isExpansionTileOpen = false;
  bool isClickedPerson = false;
  void toggleExpansion() {
    setState(() {
      isExpansionTileOpen = !isExpansionTileOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AddStoryProfileComponent(),
              SizedBox(
                width: 8,
              ),
              ProfileLabelCount(count: "140", labelText: "Posts"),
              ProfileLabelCount(count: "322", labelText: "Followers"),
              ProfileLabelCount(count: "232", labelText: "Following"),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'prabesh_rz',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  'Welcome to my Profile',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 160,
                height: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Container(
                width: 160,
                height: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Share Profile",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  iconSize: 18,
                  onPressed: () {
                    setState(() {
                      isClickedPerson = !isClickedPerson;
                    });
                  },
                  icon: Icon(
                      isClickedPerson ? Icons.person_outline : Icons.person),
                ),
              ),
            ],
          ),
        ),
        ExpansionTile(
          onExpansionChanged: (isOpen) {
            toggleExpansion();
          },
          title: const Text(
            "Story Highlights",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          subtitle: isExpansionTileOpen
              ? const Text(
                  'Keep Your favourite stories in your profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400),
                )
              : null,
          trailing: Icon(
              isExpansionTileOpen
                  ? Icons.expand_less_outlined
                  : Icons.expand_more_outlined,
              color: Colors.grey.shade500),
          children: [
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return index != 0
                      ? Container(
                          width: 80,
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey.shade300,
                          ),
                        )
                      : SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Icon(Icons.add, size: 30),
                              ),
                              const SizedBox(height: 4),
                              const Text('New',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))
                            ],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
        Divider(
          height: 1,
          color:
              isExpansionTileOpen ? Colors.transparent : Colors.grey.shade400,
        )
      ],
    );
  }
}
