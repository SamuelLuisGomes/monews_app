import 'package:flutter/material.dart';
import 'package:monews_app/themes/theme.dart';
import 'package:monews_app/themes/theme_provider.dart';
import 'package:monews_app/views/autenticacao/login_view.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: darkMode,
          theme: themeProvider.themeData,
          home: LoginView(),
        );
      },
    );
  }
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       darkTheme: darkMode,
//       theme: Provider.of<ThemeProvider>(context).themeData,
//       home: LoginView(),
//     );
//   }
// }
