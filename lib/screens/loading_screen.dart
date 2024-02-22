import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getWeather() async {
    var location = await Location.get();
    var weather = await WeatherService.getCurrentWeather(location);
    print(weather.getWeatherIcon());
    print(weather.getMessage());
    print("HEY!");
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Placeholder());
  }
}
