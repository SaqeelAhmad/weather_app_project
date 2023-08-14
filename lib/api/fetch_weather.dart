

import 'dart:convert';

import '../modle/weather_data.dart';
import '../modle/weather_data_current.dart';
import '../modle/weather_data_daily.dart';
import '../modle/weather_data_hourly.dart';
import 'api_key.dart';
import 'package:http/http.dart'as http;

class FetchWeatherAPI {
  WeatherData? weatherData;

  // procecssing the data from response -> to json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));

    return weatherData!;
  }
}
