// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/user_models.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({
    Key? key,
    this.name,
    this.id,
    this.position,
  }) : super(key: key);

  final String? name;
  final int? id;
  final String? position;

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController.text = widget.name ?? "";
    positionController.text = widget.position ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add user Screen"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Cannot be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter name",
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: positionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Cannot be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter position",
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    UserRepository userRepository = UserRepository();

                    UserModels userModel = UserModels(
                      id: widget.id,
                      name: nameController.text,
                      position: positionController.text,
                    );

                    if (widget.name == null) {
                      final response =
                          await userRepository.postUserData(userModel);
                      showSnackBar(response, false);
                    } else {
                      final response =
                          await userRepository.editUserData(userModel);
                      showSnackBar(response, true);
                    }
                  }
                },
                child: const Text(
                  "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSnackBar(bool response, bool isEdit) {
    if (response) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isEdit
              ? "User data edited successfully"
              : "User added Successfully"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isEdit
              ? "User data could't be edited"
              : "User couldn't be added"),
        ),
      );
    }
  }
}
