import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demoapp/model/weather.dart';

class WeatherService {
  final apiKey = '74e7af90fc7fcc56433d4eec6b4ceab4'; // Replace with your API key

  Future<Weather> fetchWeatherData(double lat, double lon) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';


    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load weather data');
    }
  }
}