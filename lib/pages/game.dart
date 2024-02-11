import 'dart:async';
import 'package:flutter/material.dart';

import 'package:pexeso_project/functions/game_func.dart';

const double cardHeightEasy = 160;
const double cardWidthEasy = 100;

const PexesoIcon alreadyMatched =
    PexesoIcon(currentIcon: Icons.zoom_out_sharp, iconSize: 80);

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
  late List<PexesoIcon?>? pexesoItems = createRandomList(widget.difficulty);
  late List<bool> isFrontSide = createBoolList(pexesoItems);
  late bool alreadySelectedPiece = false;
  late PexesoIcon? selectedPiece;
  late bool isGameOver = false;
  late int selectedPieceIndex;
  late bool isWaiting = false;

  @override
  Widget build(BuildContext context) {
    if (widget.difficulty == 1) {
      if (isGameOver) {
        return const Placeholder();
      } else {
        return Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i <= 3; i++)
                    if (pexesoItems?[i] == alreadyMatched)
                      const SizedBox(
                        height: cardHeightEasy,
                        width: cardWidthEasy,
                      )
                    else
                      GestureDetector(
                          onTap: () {
                            onTapFlipCardFunc(i);
                          },
                          child: isFrontSide[i]
                              ? const FrontSideCard()
                              : BackSideCard(pexesoItems: pexesoItems, i: i))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 4; i <= 7; i++)
                    if (pexesoItems?[i] == alreadyMatched)
                      const SizedBox(
                        height: cardHeightEasy,
                        width: cardWidthEasy,
                      )
                    else
                      GestureDetector(
                          onTap: () {
                            onTapFlipCardFunc(i);
                          },
                          child: isFrontSide[i]
                              ? const FrontSideCard()
                              : BackSideCard(pexesoItems: pexesoItems, i: i))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 8; i <= 11; i++)
                    if (pexesoItems?[i] == alreadyMatched)
                      const SizedBox(
                        height: cardHeightEasy,
                        width: cardWidthEasy,
                      )
                    else
                      GestureDetector(
                          onTap: () {
                            onTapFlipCardFunc(i);
                          },
                          child: isFrontSide[i]
                              ? const FrontSideCard()
                              : BackSideCard(pexesoItems: pexesoItems, i: i))
                ],
              ),
            ],
          ),
        );
      }
    } else if (widget.difficulty == 2) {
      return Container();
    } else {
      return Container();
    }
  }

  void onTapFlipCardFunc(int i) {
    if (isWaiting) {
      return;
    }
    if (isFrontSide[i] == false) {
      return; // Zjistí, jestli náhodou už není karta otočená
    }

    isFrontSide[i] = false;

    if (!alreadySelectedPiece) {
      selectedPieceIndex = i;
      selectedPiece = pexesoItems?[i];
      alreadySelectedPiece = true;
    } else {
      if (selectedPiece?.currentIcon == pexesoItems?[i]?.currentIcon) {
        pexesoItems?[i] = alreadyMatched;
        pexesoItems?[selectedPieceIndex] = alreadyMatched;

        if (isEveryElementSame(pexesoItems, alreadyMatched)) {
          isGameOver = true;
        }
      } else {
        isWaiting = true;
        Future.delayed(const Duration(milliseconds: 2500), () {
          isFrontSide[i] = true;
          isFrontSide[selectedPieceIndex] = true;
          isWaiting = false;
        });
      }
      alreadySelectedPiece = false;
    }
  }
}

class BackSideCard extends StatelessWidget {
  const BackSideCard({
    Key? key,
    required this.pexesoItems,
    required this.i,
  }) : super(key: key);

  final List<PexesoIcon?>? pexesoItems;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: SizedBox(
          width: cardWidthEasy,
          height: cardHeightEasy,
          child: pexesoItems?[i],
        ),
      ),
    );
  }
}

class FrontSideCard extends StatelessWidget {
  const FrontSideCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: const SizedBox(
          width: cardWidthEasy,
          height: cardHeightEasy,
          child: Icon(Icons.question_mark, size: 100),
        ),
      ),
    );
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
