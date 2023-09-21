import 'package:flutter/material.dart';
import 'package:monews_app/views/autenticacao/login_view.dart';
import 'package:monews_app/views/noticias/noticias_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
