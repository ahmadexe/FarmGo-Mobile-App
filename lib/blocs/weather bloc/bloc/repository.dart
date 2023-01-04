
import 'package:farmgo/models/weather_response.dart';

import 'data_provider.dart';

class WeatherRepository {
  Future<WeatherResponse> getWeatherResponse(double lat, double long) async {
    Map<String, dynamic> dataMap = await WeatherDataProvider.getWeatherResponse(lat, long);
    WeatherResponse response = WeatherResponse.fromJson(dataMap);
    return response;
  }
}