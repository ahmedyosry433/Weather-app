import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/weather-provider.dart';
import 'package:weatherapp/screen/home.dart';
import 'package:weatherapp/screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<WeatherProvider>(
            create: (context) => WeatherProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/splash': (context) => const Splash(),
        },
      ),
    );
  }
}
