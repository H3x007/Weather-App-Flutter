import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });
  factory WeatherModel.formJson(Map<String, dynamic> json) {
    var jsonData = json['forecast']['forecastday'][0];

    return WeatherModel(
        date: DateTime.parse(json['current']['last_updated']),
        temp: jsonData['day']['avgtemp_c'],
        maxTemp: jsonData['day']['maxtemp_c'],
        minTemp: jsonData['day']['mintemp_c'],
        weatherStateName: jsonData['day']['condition']['text']);
  }

  String getImage() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Light cloud' ||
        weatherStateName == 'clear' || weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' || weatherStateName == 'Blizzard' || weatherStateName == 'Patchy snow possible') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstrom' ||
        weatherStateName == 'thunderstrom' ||
        weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstrom.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Patchy rain possible') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstrom') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
