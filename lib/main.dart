import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wineadore/configs/app_theme.dart';
import 'package:wineadore/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wine Adore',
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.light(
          primary: AppTheme.primaryColor,
          background: Colors.white
        ),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
