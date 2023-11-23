// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather-model.dart';
import 'package:intl/intl.dart';

import '../core/constant/constants.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? weatherData;
  bool isLoad = false;
  bool isNotExist = false;
  Future fetchData({required String city}) async {
    isLoad = false;
    isNotExist = false;
    String url = '${Constants.keyUrl}$city${Constants.daysUrl}';
    try {
      var jsonData = await http.get(Uri.parse(url));

      if (jsonData.statusCode == 200) {
        final data = jsonDecode(jsonData.body);

        WeatherModel weatherDataObj = WeatherModel.fromJson(data);
        weatherData = weatherDataObj;
      } else {
        isNotExist = true;
      }
    } catch (e) {
      throw Exception('__________$e');
    }
    isLoad = true;
    print(
        '_______________HOW_____________________${weatherData!.forecastdays.length}');
    notifyListeners();
  }
 //convert date tima to day String
  String convertDataToDayName(String data) {
    DateTime date = DateTime.parse(data);
    var format = DateFormat('EEEE').format(date);
    notifyListeners();
    return format;
  }
}
