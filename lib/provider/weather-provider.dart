// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather-model.dart';
import 'package:intl/intl.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? weatherData;
  bool isLoad = false;
  Future fetchData({required String city}) async {
    String url =
        'https://api.weatherapi.com/v1/forecast.json?key=1ce09f90208f4599a8d182740230911&q=$city&days=6&aqi=no&alerts=no';

    var jsonData = await http.get(Uri.parse(url));
    if (jsonData.statusCode == 200) {
      final data = jsonDecode(jsonData.body);

      WeatherModel weatherDataObj = WeatherModel.fromJson(data);

      weatherData = weatherDataObj;

      print(weatherData);
    }
    isLoad = true;
    notifyListeners();
  }

  String convertDataToDayName(String data) {
    DateTime date = DateTime.parse(data);
    var format = DateFormat('EEEE').format(date);
    notifyListeners();
    return format;
  }
}
