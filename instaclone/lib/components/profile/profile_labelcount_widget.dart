import 'package:flutter/material.dart';

class ProfileLabelCount extends StatelessWidget {
  const ProfileLabelCount(
      {super.key, required this.count, required this.labelText});
  final String count;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            labelText,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
