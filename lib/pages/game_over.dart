import 'package:flutter/material.dart';
import 'package:pexeso_project/functions/game_func.dart';

class GameOver extends StatelessWidget {
  const GameOver(
      {Key? key,
      required this.difficulty,
      required this.timeInMiliseconds,
      required this.numberOfAttempts})
      : super(key: key);

  final int? difficulty;
  final int timeInMiliseconds;
  final int numberOfAttempts;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            appBar: gameOverAppBar(difficulty!.toInt(), context),
            body: Container()));
  }
}

AppBar gameOverAppBar(int? difficulty, BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    centerTitle: true,
    title: Text(
      "${convertLvlToWords(difficulty!.toInt())} level completed!",
      style: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white70),
    ),
    toolbarHeight: 80,
    leading: const SizedBox(height: 0, width: 0),
  );
}
