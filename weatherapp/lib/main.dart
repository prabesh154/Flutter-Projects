import 'package:flutter/material.dart';
import 'package:weatherapp/dataapi_service.dart';
import 'package:weatherapp/weather_models.dart';

import 'components/additional_info.dart';
import 'components/current_weather_wigdet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 193, 234)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _cityTextController = TextEditingController();
  final _dataService = DataApiService();
  WeatherModels? data; // Use nullable WeatherModels and initialize with null

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Color.fromARGB(255, 23, 151, 60),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 23, 151, 60),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Show weather information if data is available
            if (data != null)
              currentWeather(
                Icons.wb_sunny_rounded,
                "${data!.main.temp}", // Access temperature
                data!.name, // Access name of city
              ),
            if (data != null) ...[
              // Additional Information
              const SizedBox(height: 50),
              const Text(
                "Additional Information",
                style: TextStyle(
                  color: Color.fromARGB(255, 48, 157, 48),
                  fontSize: 18,
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              // Show additional information if data is available
              additionalInfo(
                "${data!.wind.speed}", // Access wind
                "${data!.main.humidity}", // Access humidity
                "${data!.main.pressure}", // Access pressure
                data!.weather[0].toString(), // Access weather
              ),
            ],
            // TextFormField and "Search" button to change city name and trigger a new search
            Container(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 60,
                vertical: 30,
              ),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Enter City Name",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 127, 130, 137),
                  ),
                ),
                controller: _cityTextController,
              ),
            ),
            ElevatedButton(
              onPressed: _search,
              style: _buttonStyle ??
                  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 23, 151, 60),
                    ),
                  ),
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Color.fromARGB(255, 249, 250, 249),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle? _buttonStyle; // ButtonStyle variable to hold the style changes

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => data = response);
  }
}
