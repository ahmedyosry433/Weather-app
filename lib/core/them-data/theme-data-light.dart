// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'app-colors.dart';

ThemeData getThemeDataLight() => ThemeData(
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 130,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor),
        headlineMedium: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor),
        headlineSmall: TextStyle(fontSize: 25, color: AppColors.whiteColor),
        titleLarge: TextStyle(fontSize: 22, color: AppColors.orangeColor),
        titleMedium: TextStyle(fontSize: 20, color: AppColors.whiteColor),
        titleSmall: TextStyle(fontSize: 15, color: AppColors.orangeColor),
      ),
    );
