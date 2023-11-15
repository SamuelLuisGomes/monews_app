import 'package:flutter/material.dart';
import 'package:monews_app/components/app_bar_components.dart';

class PaginaNoticiasView extends StatelessWidget {
  const PaginaNoticiasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: MenuVoltar(),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Center(
              child: Text(
                "Página da Notícia",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
