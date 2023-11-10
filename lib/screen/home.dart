import 'dart:ui';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:weatherapp/provider/weather-provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

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
    final weatherDataFromProvider =
        Provider.of<WeatherProvider>(context, listen: false).weatherData;

    final subProvider = Provider.of<WeatherProvider>(context, listen: false);
    final subProviders = Provider.of<WeatherProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
      
          body: !subProviders.isLoad
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background Image
                    Image.asset(
                      'assets/image/00.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Blurred Image Overlay
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    // Your content goes here
                    LoadingAnimationWidget.inkDrop(
                      color: Colors.white,
                      size: 100,
                    )
                  ],
                )
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.blueAccent,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(30, 70, 30, 30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextField(
                                  controller: searchController,
                                  // onChanged: (value) =>
                                  //     subProvider.fetchData(city: value),
                                  onEditingComplete: () {
                                    subProvider.fetchData(
                                        city: searchController.text);
                                    FocusScope.of(context).unfocus();
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search',
                                      icon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.search,
                                          )))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 4)),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              weatherDataFromProvider != null
                                  ? '${weatherDataFromProvider.cityName}, ${weatherDataFromProvider.country}'
                                  : '',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                        const SizedBox(height: 70),
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
                                  style: const TextStyle(
                                      fontSize: 130, color: Colors.white),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 4)),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/image/sunny.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                      weatherDataFromProvider != null
                                          ? '${weatherDataFromProvider.conditionText}'
                                          : '',
                                      style: const TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 22)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 130),
                        const Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tuesday',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    '35',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Divider(
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Wednesday',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    '20',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Divider(
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Thursday',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    '20',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }
}
