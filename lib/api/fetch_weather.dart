import 'dart:convert';
import 'package:cvproject_getx_weather/models/weather/weather_data.dart';
import 'package:cvproject_getx_weather/models/weather/weather_data_current.dart';
import 'package:cvproject_getx_weather/models/weather/weather_data_daily.dart';
import 'package:cvproject_getx_weather/models/weather/weather_data_hourly.dart';
import 'package:cvproject_getx_weather/utils/api_url.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonstring = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonstring),
        WeatherDataHourly.fromJson(jsonstring),
        WeatherDataDaily.fromJson(jsonstring));
    return weatherData!;
  }
}
