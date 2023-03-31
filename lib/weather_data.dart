import 'package:flutter/foundation.dart';

import 'model/weather.dart';

class WeatherData {
  static final WeatherData instance = WeatherData._internal();

  WeatherData._internal();

  final _weather = ValueNotifier<Weather?>(null);

  Weather? get weather => _weather.value;

  setWeather(Weather weather) {
    _weather.value = weather;
  }

  ValueListenable<Weather?> get weatherListenable => _weather;
}
