import 'package:flutter/material.dart';
import 'package:pexeso_project/pages/difficulty_selector.dart';
import 'package:pexeso_project/pages/home.dart';
import 'package:pexeso_project/pages/scoreboard.dart';
import 'package:pexeso_project/pages/settings.dart';
import 'package:scaled_app/scaled_app.dart';

void main() {
  runAppScaled(const MyApp(), scaleFactor: ((deviceSize) {
    const double widthOfDesign = 412; // in dpi
    return deviceSize.width / widthOfDesign;
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/settings': (context) => const SettingsWindow(),
        '/scoreboard': (context) => const ScoreboardPage(),
        '/difficulty': (context) => const DifficultySelectorPage(),
      },
    );
  }
}
