import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.grey,
  colorScheme: const ColorScheme.light(
    background: Color.fromRGBO(236, 254, 255, 1),
    primary: Colors.grey,
    secondary: Color.fromRGBO(52, 53, 53, 1),
  ),
  scaffoldBackgroundColor: Color.fromRGBO(236, 254, 255, 1),
  useMaterial3: true,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  // primaryColor: Color.fromARGB(255, 5, 40, 49),
  primaryColor: Color.fromRGBO(21, 94, 117, 1), // cyan - 800
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Color.fromARGB(255, 5, 40, 49), // cyan-600
    secondary: Color.fromRGBO(8, 51, 68, 1), // cyan-700
  ),
  scaffoldBackgroundColor: Colors.black,
  useMaterial3: true,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);
// ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: const Color.fromRGBO(14, 116, 144, 1),
//   colorScheme: const ColorScheme.dark(
//     background: Color.fromRGBO(255, 255, 255, 0),
//     primary: Color.fromRGBO(8, 145, 178, 0.8), // cyan-600
//     secondary: Color.fromRGBO(14, 116, 144, 1), // cyan-700
//   ),
//   scaffoldBackgroundColor: const Color.fromRGBO(7, 2, 34, 0.4),
//   useMaterial3: true,
//   textTheme: const TextTheme(
//     displaySmall: TextStyle(
//       color: Colors.white,
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
// );
