import 'dart:convert';

import 'package:farmgo/static/api%20constants/keys.dart';
import 'package:http/http.dart' as http;

class WeatherDataProvider {
  static final _client = http.Client();
  
  static Future<Map<String, dynamic>> getWeatherResponse(double lat, double long) async {
    try {
      String url = 'https://api.openweathermap.org/data/2.5/weather?lat=${lat.toString()}&lon=${long.toString()}&appid=$weatherApiKey';
      var response = await _client.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonData;
      } else {
        throw("Can't load weather data at the moment.");
      }
    } catch(e) {
      throw(e.toString());
    }
  }

}