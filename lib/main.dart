import 'package:flutter/material.dart';
import 'package:inunity/presentation/main_page/main_page.dart';
import 'package:inunity/presentation/welcomScreen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InUnity',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
