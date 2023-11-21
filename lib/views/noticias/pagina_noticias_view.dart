import 'package:flutter/material.dart';
import 'package:monews_app/components/app_bar_components.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaginaNoticiasView extends StatelessWidget {
  String url;
  PaginaNoticiasView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      // appBar: MenuVoltar(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "MO",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "NEWS",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      )),
    );
  }
}
