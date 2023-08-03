import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String location) {
  return Center(
    child: Column(
      children: [
        Icon(
          icon,
          color: Colors.orange,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          temp,
          style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        const Text(' Celsius'),
        const SizedBox(height: 10),
        Text(
          location,
          style: const TextStyle(
              fontSize: 25, color: Color.fromARGB(255, 84, 104, 218)),
        ),
      ],
    ),
  );
}
