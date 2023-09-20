import 'package:flutter/material.dart';
import 'package:monews_app/views/registro_view.dart';

class NoticiasView extends StatefulWidget {
  @override
  State<NoticiasView> createState() => _NoticiasViewtState();
}

class _NoticiasViewtState extends State<NoticiasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem Vindo as Notícias !!'),
          ],
        )),
      ),
    );
  }
}
