import 'package:flutter/material.dart';
import 'package:ukk_kasir/pages/admin/navbar.dart';
import 'package:ukk_kasir/pages/cashierpage.dart';
import 'package:ukk_kasir/pages/loginpage.dart';
import 'package:ukk_kasir/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Fluterku',
      home: SplashScreenPage(),
      routes: {
        '/admin': (context) => MyHomePage(),
        '/kasir': (context) => kasir(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
