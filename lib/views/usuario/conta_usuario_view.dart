import 'package:flutter/material.dart';
import 'package:monews_app/components/app_bar_components.dart';

class ContaUsuarioView extends StatefulWidget {
  @override
  State<ContaUsuarioView> createState() => _ContaUsuarioViewState();
}

class _ContaUsuarioViewState extends State<ContaUsuarioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: menuVoltar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
