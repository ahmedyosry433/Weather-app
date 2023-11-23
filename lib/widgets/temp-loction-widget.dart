// ignore_for_file: unnecessary_null_comparison, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/core/them-data/app-colors.dart';

import '../provider/weather-provider.dart';

class TempAndLoctionWidget extends StatelessWidget {
  const TempAndLoctionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherDataFromProvider =
        Provider.of<WeatherProvider>(context, listen: false).weatherData;
    final subProviders = Provider.of<WeatherProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.whiteColor, width: 4)),
            ),
            const SizedBox(width: 10),
            Text(
              weatherDataFromProvider != null
                  ? '${weatherDataFromProvider.region.length >= 9 ? weatherDataFromProvider.region.substring(0, 9) : weatherDataFromProvider.region}${weatherDataFromProvider.region == "" ? '' : ','} ${weatherDataFromProvider.cityName.length >= 9 ? weatherDataFromProvider.cityName.substring(0, 9) : weatherDataFromProvider.cityName}, ${weatherDataFromProvider.country.length >= 9 ? weatherDataFromProvider.country.substring(0, 9) : weatherDataFromProvider.country}'
                  : '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          weatherDataFromProvider != null
              ? subProviders.convertDataToDayName(weatherDataFromProvider.data)
              : '',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherDataFromProvider != null
                      ? "${weatherDataFromProvider.temp.toInt()}"
                      : '',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.whiteColor, width: 4)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    weatherDataFromProvider!.conditionText == 'Sunny'
                        ? 'assets/image/sunny.png'
                        : weatherDataFromProvider.conditionText == 'Over cast'
                            ? 'assets/image/overCast.png'
                            : weatherDataFromProvider.conditionText ==
                                    'Partly cloudy'
                                ? 'assets/image/partly cloudy.png'
                                : weatherDataFromProvider.conditionText ==
                                        'Clear'
                                    ? 'assets/image/clear.png'
                                    : weatherDataFromProvider.conditionText ==
                                            'Patchy rain possible'
                                        ? 'assets/image/patch rain.png'
                                        : 'assets/image/partly cloudy.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(
                      weatherDataFromProvider != null
                          ? '${weatherDataFromProvider.conditionText}'
                          : '',
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ],
    );
  }
}
