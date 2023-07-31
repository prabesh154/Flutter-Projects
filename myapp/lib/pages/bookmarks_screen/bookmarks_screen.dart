import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:myapp/consts/consts.dart';
import 'package:myapp/pages/bookmarks_screen/videoplayer_screen.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Learning about Video Controller',
            style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 20,
                fontFamily: billabong,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.pinkAccent)),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.video,
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  if (mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoPlayerScreen(videoFile: file),
                      ),
                    );
                  }
                } else {
                  // User canceled the picker
                }
              },
              child: const Center(child: Text("Pick a file")),
            ),
          ),
        ],
      ),
    );
  }
}
