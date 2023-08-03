/*                          

{

  "weather": [
    {

      "description": "moderate rain",
      "icon": "10d"
    }
  ],

  "main": {
    "temp": 298.48,
    "feels_like": 298.74,
    "pressure": 1015,
    "humidity": 64,
  },
  "wind": {
    "speed": 0.62,
  },
}                        
                      
*/
// To parse this JSON data, do
//
//     final weatherModels = weatherModelsFromJson(jsonString);

import 'dart:convert';

WeatherModels weatherModelsFromJson(String str) =>
    WeatherModels.fromJson(json.decode(str));

String weatherModelsToJson(WeatherModels data) => json.encode(data.toJson());

class WeatherModels {
  List<Weather> weather;
  Main main;
  Wind wind;
  String name;

  WeatherModels({
    required this.weather,
    required this.main,
    required this.wind,
    required this.name,
  });

  factory WeatherModels.fromJson(Map<String, dynamic> json) => WeatherModels(
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        wind: Wind.fromJson(json["wind"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "main": main.toJson(),
        "wind": wind.toJson(),
        "name": name,
      };
}

class Main {
  double temp;
  double feelsLike;
  int pressure;
  int humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Weather {
  String description;
  String icon;

  Weather({
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "icon": icon,
      };
}

class Wind {
  double speed;

  Wind({
    required this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
      };
}
