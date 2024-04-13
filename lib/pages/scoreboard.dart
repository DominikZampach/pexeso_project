import 'package:flutter/material.dart';
import 'package:pexeso_project/functions/database.dart';
import 'package:pexeso_project/widgets/appbar_const.dart';
import 'package:pexeso_project/widgets/back_leading.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  late int selectedDifficulty = 1;

  void updateScoreboard(int difficulty) {
    setState(() {
      selectedDifficulty = difficulty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarScoreboard(context),
      body: Container(
        color: Theme.of(context).primaryColor.withOpacity(0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              buttonPadding: const EdgeInsets.all(10.0),
              children: [
                ElevatedButton(
                    onPressed: () {
                      updateScoreboard(1);
                    },
                    child: const Text("Easy")),
                ElevatedButton(
                    onPressed: () {
                      updateScoreboard(2);
                    },
                    child: const Text("Medium")),
                ElevatedButton(
                    onPressed: () {
                      updateScoreboard(3);
                    },
                    child: const Text("Hard"))
              ],
            ),
            scoreboardByDifficulty(context, selectedDifficulty)
          ],
        ),
      ),
    );
  }

  Widget scoreboardByDifficulty(BuildContext context, int difficulty) {
    return FutureBuilder<List<Map>>(
      future: getSpecificDifficultyRecords(difficulty),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text("Error occurred");
        } else {
          List<Map>? difficultyRecords = snapshot.data;
          return Column(
            children: [
              Text(
                "Top 3: ${createLabelForScoreboard(difficulty)}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  thickness: 6,
                  color: Colors.white,
                ),
              ),
              Column(
                children: List.generate(
                    (difficultyRecords!.length < 3)
                        ? difficultyRecords.length
                        : 3,
                    (index) => ListTile(
                          title: Text(
                            "${getEmojisByRanking(index + 1)}: ${difficultyRecords[index]["timemilisecond"] / 1000}s",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )),
              )
            ],
          );
        }
      },
    );
  }

  String getEmojisByRanking(int place) {
    switch (place) {
      case 1:
        return "🥇";
      case 2:
        return "🥈";
      case 3:
        return "🥉";
      default:
        return "🗿";
    }
  }

  AppBar appbarScoreboard(BuildContext context) {
    return AppBar(
      title: const Text(
        "Scoreboard",
      ),
      titleTextStyle: appbarTitleStyle(),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      leading: backLeading(context),
      toolbarHeight: 80,
    );
  }

  String createLabelForScoreboard(int difficulty) {
    switch (difficulty) {
      case 1:
        return "Easy difficulty";
      case 2:
        return "Medium difficulty";
      case 3:
        return "Hard difficulty";
      default:
        return "Error";
    }
  }
}
