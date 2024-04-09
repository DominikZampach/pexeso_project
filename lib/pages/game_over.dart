import 'package:flutter/material.dart';
import 'package:pexeso_project/functions/database.dart';
import 'package:pexeso_project/functions/game_func.dart';
import 'package:pexeso_project/pages/game.dart';
import 'package:pexeso_project/pages/home.dart';

class GameOver extends StatefulWidget {
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
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  @override
  void initState() {
    saveToDatabase(
        widget.numberOfAttempts, widget.difficulty!, widget.timeInMiliseconds);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            appBar: gameOverAppBar(widget.difficulty!.toInt(), context),
            body: gameOverBody(widget.difficulty!.toInt(),
                widget.timeInMiliseconds, widget.numberOfAttempts, context)));
  }
}

Container gameOverBody(int difficulty, int timeInMiliseconds,
    int numberOfAttempts, BuildContext context) {
  return Container(
    alignment: Alignment.center,
    color: Theme.of(context).primaryColor.withOpacity(0.6),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            "Difficulty: ${convertLvlToWords(difficulty)}",
            style: const TextStyle(
                fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Number of attempts: $attempts",
            style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Time: ${timeInMiliseconds / 1000} s",
            style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 300.0),
            child: ElevatedButton.icon(
                label: const Text(
                  "Home",
                  style: TextStyle(fontSize: 32),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                icon: const Icon(
                  Icons.home,
                  size: 70,
                  color: Colors.black,
                )))
        // TODO tady bude Table s nejlepšími výsledky z SQLite databáze (bude se muset nechat vytvořit pokud ještě není vytvořená při prvním spuštění aplikace)
      ],
    ),
  );
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
