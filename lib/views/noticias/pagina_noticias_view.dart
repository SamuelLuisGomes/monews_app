import 'package:flutter/material.dart';
import 'package:monews_app/components/app_bar_components.dart';
import 'package:monews_app/components/app_bar_static_components.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaginaNoticiasView extends StatelessWidget {
  String url;
  PaginaNoticiasView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey[900],
      // appBar: MenuVoltar(),
      appBar: AppBarStatic(),
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
