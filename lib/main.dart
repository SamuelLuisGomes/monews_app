import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monews_app/themes/theme_provider.dart';
import 'package:monews_app/views/app.dart';
import 'package:provider/provider.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyAEKtLCz8mC-1ZI2mAS1jYcGnGtY3fa2hk",
    authDomain: "monews-9db1b.firebaseapp.com",
    projectId: "monews-9db1b",
    storageBucket: "monews-9db1b.appspot.com",
    messagingSenderId: "978215004030",
    appId: "1:978215004030:web:f408e26c53a91ccfb1752f");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  final themeProvider = ThemeProvider();
  await themeProvider.temaInicial();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}
