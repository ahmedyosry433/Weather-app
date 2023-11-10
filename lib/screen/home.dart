// ignore_for_file: unnecessary_null_comparison

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:weatherapp/provider/weather-provider.dart';
import 'package:weatherapp/widgets/splash.dart';

import '../core/them-data/app-colors.dart';
import '../widgets/forcastdays-widget.dart';
import '../widgets/search-widget.dart';
import '../widgets/temp-loction-widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  getWeatherData() async {
    context.read<WeatherProvider>().fetchData(city: 'cairo');
  }

  @override
  Widget build(BuildContext context) {
    final subProviders = Provider.of<WeatherProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: !subProviders.isLoad
            ? const Splash()
            : Container(
                height: double.infinity,
                width: double.infinity,
                color: AppColors.primaryColor,
                child: SingleChildScrollView(
                  child: !subProviders.isNotExist
                      ? Column(
                          children: [
                            SearchWidget(),
                            const TempAndLoctionWidget(),
                            const SizedBox(height: 10),
                            const ForCostDaysWidget()
                          ],
                        )
                      : Column(
                          children: [
                            SearchWidget(),
                            Image.asset('assets/image/notfound.png'),
                            Text(
                              'No Matching Location Found.',
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ],
                        ),
                ),
              ),
      ),
    );
  }
}
