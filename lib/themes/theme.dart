import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color.fromRGBO(236, 254, 255, 1),
    primary: Color.fromRGBO(0, 0, 0, 0),
    secondary: Color.fromRGBO(52, 53, 53, 0),
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(236, 254, 255, 1),
  useMaterial3: true,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color.fromRGBO(255, 255, 255, 0),
    primary: Color.fromRGBO(8, 145, 178, 0.8), // cyan-600
    secondary: Color.fromRGBO(14, 116, 144, 1), // cyan-700
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(7, 2, 34, 0.4),
  useMaterial3: true,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);
