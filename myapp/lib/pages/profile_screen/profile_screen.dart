import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // won't have any error now
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile ImagePicker"),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8), // Border radius
                  child: ClipOval(
                    child: selectedImage != null
                        ? Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          )
                        : Container(
                            color: Colors
                                .transparent, // Set the color to transparent for a blank space.
                            height: 100,
                            width: 100,
                          ),

                    // child: selectedImage != null
                    // ? Image.file(
                    //     selectedImage!,
                    //     fit: BoxFit.cover,
                    //     height: 100,
                    //     width: 100,
                    //   )
                    // : Image.network(
                    //     'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                    //     fit: BoxFit.cover,
                    //     height: 100,
                    //     width: 100,
                    //   )),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  chooseImage("camera");
                },
                child: const Text(" Image from Camera"),
              ),
              ElevatedButton(
                onPressed: () {
                  chooseImage("Gallery");
                },
                child: const Text("Image From Gallery"),
              ),
            ],
          ),
        ));
  }
}
