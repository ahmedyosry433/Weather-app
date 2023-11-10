// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/core/them-data/app-colors.dart';

import '../provider/weather-provider.dart';

class ForCostDaysWidget extends StatelessWidget {
  const ForCostDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherDataFromProvider =
        Provider.of<WeatherProvider>(context, listen: false).weatherData;
    final subProviders = Provider.of<WeatherProvider>(context);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: weatherDataFromProvider!.forecastdays.length - 1,
        itemBuilder: (context, index) {
          final forcastdayData =
              weatherDataFromProvider.forecastdays[index + 1];
          return Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subProviders.convertDataToDayName(forcastdayData['date']),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        forcastdayData['day']['condition']['text'] == 'Sunny'
                            ? 'assets/image/sunny.png'
                            : forcastdayData['day']['condition']['text'] ==
                                    'Over cast'
                                ? 'assets/image/overCast.png'
                                : forcastdayData['day']['condition']['text'] ==
                                        'Partly cloudy'
                                    ? 'assets/image/partly cloudy.png'
                                    : forcastdayData['day']['condition']
                                                ['text'] ==
                                            'Clear'
                                        ? 'assets/image/clear.png'
                                        : forcastdayData['day']['condition']
                                                    ['text'] ==
                                                'Patchy rain possible'
                                            ? 'assets/image/patch rain.png'
                                            : 'assets/image/patch rain.png',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 10),
                      Text(
                          forcastdayData['day']['condition']['text'] != null
                              ? '${forcastdayData['day']['condition']['text']}'
                              : '',
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${forcastdayData['day']['avgtemp_c'].toInt()}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1)),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Divider(
                  color: AppColors.whiteColor,
                ),
              ),
            ]),
          );
        });
  }
}
