import 'package:flutter/material.dart';
import 'dart:async';

const List<Icon> iconsList = [
  Icon(Icons.house),
  Icon(Icons.toys),
  Icon(Icons.alarm),
  Icon(Icons.adf_scanner),
  Icon(Icons.airplanemode_active),
  Icon(Icons.photo_camera),
  Icon(Icons.backpack),
  Icon(Icons.iron),
  Icon(Icons.discord),
  Icon(Icons.bike_scooter),
  Icon(Icons.flag),
  Icon(Icons.headphones)
]; // 12 ikon

class FullGame extends StatefulWidget {
  final int difficulty;
  final Stopwatch stopwatch;
  const FullGame({Key? key, required this.difficulty, required this.stopwatch})
      : super(key: key);

  @override
  State<FullGame> createState() => _FullGameState();
}

class _FullGameState extends State<FullGame> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Now the user cannot go back :D
      canPop: false,
      child: Scaffold(
          appBar: appBar(widget.difficulty, context, widget.stopwatch),
          // body: bodyGame(context, widget.difficulty)),
          body: GameBody(
            difficulty: widget.difficulty,
          )),
    );
  }
}

class GameBody extends StatefulWidget {
  final int? difficulty;
  const GameBody({Key? key, required this.difficulty}) : super(key: key);

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  Map<String, int>? createIconsMap(int? difficulty) {
    var possibleIcons = List.from(iconsList);
    possibleIcons.shuffle();
    if (difficulty == 1) {
      return {for (var item in possibleIcons.take(6)) item: 2};
    } else if (difficulty == 2) {
      return {for (var item in possibleIcons.take(8)) item: 2};
    } else {
      return {for (var item in possibleIcons) item: 2};
    }
  }

  @override
  Widget build(BuildContext context) {
    var mapItems = createIconsMap(widget.difficulty);

    if (widget.difficulty == 1) {
      return Container();
    } else if (widget.difficulty == 2) {
      return Container();
    } else {
      return Container();
    }
  }
}

PreferredSize appBar(int lvl, BuildContext context, Stopwatch stopwatch) =>
    PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            "Level $lvl",
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          toolbarHeight: 80,
          leading: Container(),
          flexibleSpace: Container(
            padding: const EdgeInsets.all(12),
            color: Theme.of(context).primaryColor,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time: ${(stopwatch.elapsedMilliseconds / 1000).toStringAsFixed(2)} sec",
                  style: appBarStatisticsStats(),
                ),
                Text(
                  "Attempts: xx",
                  style: appBarStatisticsStats(),
                )
              ],
            ),
          ),
        ));

PreferredSize appBarStartDialog(
        int lvl, BuildContext context, Stopwatch stopwatch) =>
    PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            "Level $lvl",
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          toolbarHeight: 80,
          leading: Container(),
        ));

TextStyle appBarStatisticsStats() {
  return const TextStyle(
      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
}
