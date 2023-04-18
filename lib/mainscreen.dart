import 'package:android_intent/android_intent.dart';
import 'package:Spark/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'model/weather.dart';
import 'services/weather_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<Weather> _weatherData;
  final _weatherService = WeatherService();
  late double _latitude;
  late double _longitude;

  @override
  void initState() {
    super.initState();
    locateUser();
  }

  void locateUser() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          _latitude = position.latitude;
          _longitude = position.longitude;
        });
        print('Latitude: $_latitude, Longitude: $_longitude');
        _fetchWeatherData();
      } else if (status.isDenied) {
        Map<Permission, PermissionStatus> status = await [
          Permission.location,
        ].request();

        if (await Permission.location.isPermanentlyDenied) {
          openAppSettings();
        }
      }
    } else {
      final AndroidIntent intent = new AndroidIntent(
          action: 'android.settings.LOCATION_SOURCE_SETTINGS');
      await intent.launch();
    }
  }

  void _fetchWeatherData() async {
  final weather = await _weatherService.fetchWeatherData(_latitude, _longitude);
  WeatherData.instance.setWeather(weather);
  setState(() {
    _weatherData = Future.value(weather);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Weather>(
        future: _weatherData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final weather = snapshot.data!;
            return Column(
              children: [
                Text(
                  '${weather.temperature}',
                  style: TextStyle(fontSize: 48),
                ),
                Text(weather.condition),
                Image.network(
                    'https://openweathermap.org/img/w/${weather.iconCode}.png'),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Failed to load weather data');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}