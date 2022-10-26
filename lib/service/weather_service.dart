import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
  String baseUrl = 'http://api.weatherapi.com/v1';
  String query = 'forecast.json';
  String apiKey = '64eab1518d7b4c21b6844622222410';


  Future<WeatherModel> getWeather({required String cityName,required String countryName}) async {
    Uri url = Uri.parse('$baseUrl/$query?key=$apiKey&country=$countryName&q=$cityName');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.formJson(data);
    return weather;
  }
}