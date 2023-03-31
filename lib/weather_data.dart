import 'package:demoapp/model/weather.dart';

class WeatherData {
  WeatherData._privateConstructor();

  static final WeatherData instance = WeatherData._privateConstructor();

  Weather? _weather;

  Weather? get weather => _weather;

  setWeather(Weather weather) {
    _weather = weather;
  }
}