import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(107, 114, 128, 1),
    colorScheme: const ColorScheme.light(
      background: Color.fromRGBO(236, 254, 255, 1),
      primary: Color.fromRGBO(21, 94, 117, 1),
      secondary: Color.fromRGBO(8, 145, 178, 1),
    ),
    scaffoldBackgroundColor: Color.fromRGBO(209, 213, 219, 1),
    // scaffoldBackgroundColor: Color.fromRGBO(236, 254, 255, 1),
    useMaterial3: true,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
        //fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
      hintStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Color.fromRGBO(8, 145, 178, 1),
      )),
      fillColor: Colors.transparent,
      filled: true,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
    ));

final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    // primaryColor: Color.fromARGB(255, 5, 40, 49),
    primaryColor: Color.fromRGBO(21, 94, 117, 1),
    colorScheme: const ColorScheme.dark(
      background: Colors.black,
      primary: Color.fromRGBO(21, 94, 117, 1),
      secondary: Color.fromRGBO(8, 145, 178, 1),
      // primary: Color.fromRGBO(8, 145, 178, 1),
      // secondary: Color.fromRGBO(21, 94, 117, 1),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(24, 24, 27, 1),
    useMaterial3: true,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
        //fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      //labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.white),
      // hintStyle: TextStyle(color: Color.fromRGBO(8, 145, 178, 1)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Color.fromRGBO(8, 145, 178, 1),
      )),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.red,
      )),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.grey,
      )),

      fillColor: Colors.transparent,
      filled: true,
    ));
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
