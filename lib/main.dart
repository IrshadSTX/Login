import 'package:flutter/material.dart';
import 'package:login_page/splash.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'UserLoggedIn';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: const ScreenSplash(),
    );
  }
}
