import 'package:flutter/material.dart';

class AcoesView extends StatefulWidget {
  @override
  State<AcoesView> createState() => _AcoesViewtState();
}

class _AcoesViewtState extends State<AcoesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem Vindo as Ações !!'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      )),
    );
  }
}
