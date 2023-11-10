// ignore_for_file: prefer_typing_uninitialized_variables, file_names

class WeatherModel {
  final cityName;
  final country;
  final temp;
  final conditionText;
  final conditionIcon;

  WeatherModel({
    required this.cityName,
    required String this.country,
    required this.temp,
    required this.conditionText,
    required this.conditionIcon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      temp: json['current']['temp_c'],
      conditionText: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
    );
  }
}
