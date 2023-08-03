import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0);
TextStyle valuefont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalInfo(
    String wind, String humidity, String pressure, String feelsLike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Wind:",
                style: titleFont,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                wind,
                style: valuefont,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Humidity:",
                style: titleFont,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                humidity,
                style: valuefont,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Pressure:",
                style: titleFont,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                pressure,
                style: valuefont,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
