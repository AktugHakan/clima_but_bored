import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static Future<WeatherModel> getCurrentWeather(Location location) async {
    var requestUrl = Uri.https('api.openweathermap.org', 'data/3.0/onecall', {
      'lat': location.lat.toStringAsFixed(6),
      'lon': location.long.toStringAsFixed(6),
      'units': 'metric',
      'appid': kApiKey,
    });
    var response = await http.get(requestUrl);
    if (response.statusCode != 200) {
      throw "Server connection error!";
    }
    var responseData = jsonDecode(utf8.decode(response.bodyBytes));

    var temp = responseData['current']['temp'];
    var weatherCode = responseData['current']['weather'][0]['id'];

    return WeatherModel(temp: temp, condition: weatherCode);
  }
}
