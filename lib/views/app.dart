import 'package:flutter/material.dart';
import 'package:monews_app/themes/theme.dart';
import 'package:monews_app/views/autenticacao/login_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
      theme: lightMode,
      darkTheme: darkMode,
      home: LoginView(),
    );
  }
}
