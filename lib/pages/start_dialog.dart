import 'package:flutter/material.dart';
import 'package:pexeso_project/pages/game.dart';

class StartDialog extends StatelessWidget {
  final int difficulty;
  final Stopwatch stopwatch = Stopwatch();
  StartDialog({
    Key? key,
    required this.difficulty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStartDialog(difficulty, context, stopwatch),
      body: Container(
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor.withOpacity(0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Press button to start level", style: appBarStatisticsStats()),
            IconButton.filled(
              onPressed: () {
                stopwatch.start();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullGame(
                              difficulty: difficulty,
                              stopwatch: stopwatch,
                            )));
              },
              icon: const Icon(Icons.play_arrow_outlined),
              iconSize: 50,
            ),
          ],
        ),
      ),
    );
  }
}
