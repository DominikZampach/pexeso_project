import 'package:flutter/material.dart';
import 'package:pexeso_project/pages/difficulty_selector.dart';
import 'package:pexeso_project/pages/home.dart';
import 'package:pexeso_project/pages/scoreboard.dart';
import 'package:pexeso_project/pages/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orangeAccent, brightness: Brightness.light),
      ),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/settings': (context) => const SettingsWindow(),
        '/scoreboard': (context) => const ScoreboardPage(),
        '/difficulty': (context) => const DifficultySelectorPage(),
      },
    );
  }
}
