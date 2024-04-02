import 'dart:async';
import 'package:flutter/material.dart';

import 'package:pexeso_project/functions/game_func.dart';
import 'package:pexeso_project/pages/game_over.dart';

const double cardHeightEasy = 160;
const double cardWidthEasy = 100;
const double cardIconSizeEasy = 100;
const double paddingEasy = 8;

const double cardHeightMedium = 160;
const double cardWidthMedium = 85;
const double cardIconSizeMedium = 80;
const double paddingMedium = 6;

const double cardHeightHard = 105;
const double cardWidthHard = 85;
const double cardIconSizeHard = 70;
const double paddingHard = 6;

const PexesoIcon alreadyMatched =
    PexesoIcon(currentIcon: Icons.zoom_out_sharp, iconSize: 0);

late int attempts;

class FullGame extends StatefulWidget {
  final int difficulty;
  final Stopwatch stopwatch;
  const FullGame({
    Key? key,
    required this.difficulty,
    required this.stopwatch,
  }) : super(key: key);

  @override
  State<FullGame> createState() => _FullGameState();
}

class _FullGameState extends State<FullGame> {
  late Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (context.mounted) {
        setState(() {});
      }
    });
    attempts = 0;
    super.initState();
  }

  void disposeTimer() {
    timer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!context.mounted) {
      return Container();
    } else {
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
      // TODO Změnit barvu karet od pozadí
      return gameEasy();
    } else if (widget.difficulty == 2) {
      return gameMedium();
    } else {
      return gameHard();
    }
  }

  Container gameHard() {
    return Container(
      alignment: Alignment.center,
      color: Theme.of(context).primaryColor.withOpacity(0.6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i <= 5; i++)
                if (pexesoItems?[i] == alreadyMatched)
                  const CardReplacement(
                    padding: paddingHard,
                    height: cardHeightHard,
                    width: cardWidthHard,
                  )
                else
                  GestureDetector(
                      onTap: () {
                        onTapFlipCardFunc(i);
                      },
                      child: isFrontSide[i]
                          ? const FrontSideCard(
                              padding: paddingHard,
                              height: cardHeightHard,
                              width: cardWidthHard,
                              iconSize: cardIconSizeHard)
                          : BackSideCard(
                              pexesoItems: pexesoItems,
                              i: i,
                              padding: paddingHard,
                              width: cardWidthHard,
                              height: cardHeightHard,
                            ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 6; i <= 11; i++)
                if (pexesoItems?[i] == alreadyMatched)
                  const CardReplacement(
                    padding: paddingHard,
                    height: cardHeightHard,
                    width: cardWidthHard,
                  )
                else
                  GestureDetector(
                      onTap: () {
                        onTapFlipCardFunc(i);
                      },
                      child: isFrontSide[i]
                          ? const FrontSideCard(
                              padding: paddingHard,
                              height: cardHeightHard,
                              width: cardWidthHard,
                              iconSize: cardIconSizeHard)
                          : BackSideCard(
                              pexesoItems: pexesoItems,
                              i: i,
                              padding: paddingHard,
                              width: cardWidthHard,
                              height: cardHeightHard,
                            ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 12; i <= 17; i++)
                if (pexesoItems?[i] == alreadyMatched)
                  const CardReplacement(
                    padding: paddingHard,
                    height: cardHeightHard,
                    width: cardWidthHard,
                  )
                else
                  GestureDetector(
                      onTap: () {
                        onTapFlipCardFunc(i);
                      },
                      child: isFrontSide[i]
                          ? const FrontSideCard(
                              padding: paddingHard,
                              height: cardHeightHard,
                              width: cardWidthHard,
                              iconSize: cardIconSizeHard)
                          : BackSideCard(
                              pexesoItems: pexesoItems,
                              i: i,
                              padding: paddingHard,
                              width: cardWidthHard,
                              height: cardHeightHard,
                            ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 18; i <= 23; i++)
                if (pexesoItems?[i] == alreadyMatched)
                  const CardReplacement(
                    padding: paddingHard,
                    height: cardHeightHard,
                    width: cardWidthHard,
                  )
                else
                  GestureDetector(
                      onTap: () {
                        onTapFlipCardFunc(i);
                      },
                      child: isFrontSide[i]
                          ? const FrontSideCard(
                              padding: paddingHard,
                              height: cardHeightHard,
                              width: cardWidthHard,
                              iconSize: cardIconSizeHard)
                          : BackSideCard(
                              pexesoItems: pexesoItems,
                              i: i,
                              padding: paddingHard,
                              width: cardWidthHard,
                              height: cardHeightHard,
                            ))
            ],
          ),
        ],
      ),
    );
  }

  Container gameMedium() {
    return Container(
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor.withOpacity(0.6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i <= 3; i++)
                  if (pexesoItems?[i] == alreadyMatched)
                    const CardReplacement(
                      padding: paddingMedium,
                      height: cardHeightMedium,
                      width: cardWidthMedium,
                    )
                  else
                    GestureDetector(
                        onTap: () {
                          onTapFlipCardFunc(i);
                        },
                        child: isFrontSide[i]
                            ? const FrontSideCard(
                                padding: paddingMedium,
                                height: cardHeightMedium,
                                width: cardWidthMedium,
                                iconSize: cardIconSizeMedium)
                            : BackSideCard(
                                pexesoItems: pexesoItems,
                                i: i,
                                padding: paddingMedium,
                                width: cardWidthMedium,
                                height: cardHeightMedium,
                              ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 4; i <= 7; i++)
                  if (pexesoItems?[i] == alreadyMatched)
                    const CardReplacement(
                      padding: paddingMedium,
                      height: cardHeightMedium,
                      width: cardWidthMedium,
                    )
                  else
                    GestureDetector(
                        onTap: () {
                          onTapFlipCardFunc(i);
                        },
                        child: isFrontSide[i]
                            ? const FrontSideCard(
                                padding: paddingMedium,
                                height: cardHeightMedium,
                                width: cardWidthMedium,
                                iconSize: cardIconSizeMedium)
                            : BackSideCard(
                                pexesoItems: pexesoItems,
                                i: i,
                                padding: paddingMedium,
                                width: cardWidthMedium,
                                height: cardHeightMedium,
                              ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 8; i <= 11; i++)
                  if (pexesoItems?[i] == alreadyMatched)
                    const CardReplacement(
                      padding: paddingMedium,
                      height: cardHeightMedium,
                      width: cardWidthMedium,
                    )
                  else
                    GestureDetector(
                        onTap: () {
                          onTapFlipCardFunc(i);
                        },
                        child: isFrontSide[i]
                            ? const FrontSideCard(
                                padding: paddingMedium,
                                height: cardHeightMedium,
                                width: cardWidthMedium,
                                iconSize: cardIconSizeMedium)
                            : BackSideCard(
                                pexesoItems: pexesoItems,
                                i: i,
                                padding: paddingMedium,
                                width: cardWidthMedium,
                                height: cardHeightMedium,
                              ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 12; i <= 15; i++)
                  if (pexesoItems?[i] == alreadyMatched)
                    const CardReplacement(
                      padding: paddingMedium,
                      height: cardHeightMedium,
                      width: cardWidthMedium,
                    )
                  else
                    GestureDetector(
                        onTap: () {
                          onTapFlipCardFunc(i);
                        },
                        child: isFrontSide[i]
                            ? const FrontSideCard(
                                padding: paddingMedium,
                                height: cardHeightMedium,
                                width: cardWidthMedium,
                                iconSize: cardIconSizeMedium)
                            : BackSideCard(
                                pexesoItems: pexesoItems,
                                i: i,
                                padding: paddingMedium,
                                width: cardWidthMedium,
                                height: cardHeightMedium,
                              ))
              ],
            )
          ],
        ));
  }

  Container gameEasy() {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.6),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i <= 3; i++)
                if (pexesoItems?[i] == alreadyMatched)
                  const CardReplacement(
                    padding: paddingEasy,
                    height: cardHeightEasy,
                    width: cardWidthEasy,
                  )
                else
                  GestureDetector(
                      onTap: () {
                        onTapFlipCardFunc(i);
                      },
                      child: isFrontSide[i]
                          ? const FrontSideCard(
                              padding: paddingEasy,
                              height: cardHeightEasy,
                              width: cardWidthEasy,
                              iconSize: cardIconSizeEasy)
                          : BackSideCard(
                              pexesoItems: pexesoItems,
                              i: i,
                              padding: paddingEasy,
                              width: cardWidthEasy,
                              height: cardHeightEasy,
                            ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 4; i <= 7; i++)
                if (pexesoItems?[i] == alreadyMatched)
                  const CardReplacement(
                    padding: paddingEasy,
                    height: cardHeightEasy,
                    width: cardWidthEasy,
                  )
                else
                  GestureDetector(
                      onTap: () {
                        onTapFlipCardFunc(i);
                      },
                      child: isFrontSide[i]
                          ? const FrontSideCard(
                              padding: paddingEasy,
                              height: cardHeightEasy,
                              width: cardWidthEasy,
                              iconSize: cardIconSizeEasy)
                          : BackSideCard(
                              pexesoItems: pexesoItems,
                              i: i,
                              padding: paddingEasy,
                              width: cardWidthEasy,
                              height: cardHeightEasy,
                            ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 8; i <= 11; i++)
                if (pexesoItems?[i] == alreadyMatched)
                  const CardReplacement(
                    padding: paddingEasy,
                    height: cardHeightEasy,
                    width: cardWidthEasy,
                  )
                else
                  GestureDetector(
                      onTap: () {
                        onTapFlipCardFunc(i);
                      },
                      child: isFrontSide[i]
                          ? const FrontSideCard(
                              padding: paddingEasy,
                              height: cardHeightEasy,
                              width: cardWidthEasy,
                              iconSize: cardIconSizeEasy)
                          : BackSideCard(
                              pexesoItems: pexesoItems,
                              i: i,
                              padding: paddingEasy,
                              width: cardWidthEasy,
                              height: cardHeightEasy,
                            ))
            ],
          ),
        ],
      ),
    );
  }

  void onTapFlipCardFunc(int i) {
    if (!mounted) {
      return;
    }
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
        isWaiting = true;
        Future.delayed(const Duration(milliseconds: 750), () {
          pexesoItems?[i] = alreadyMatched;
          pexesoItems?[selectedPieceIndex] = alreadyMatched;
          if (isEveryElementSame(pexesoItems, alreadyMatched)) {
            _FullGameState fullGameState =
                context.findAncestorStateOfType<_FullGameState>()!;
            fullGameState.disposeTimer();
            pushToGameOver(fullGameState.widget.stopwatch.elapsedMilliseconds);
          }
          isWaiting = false;
        });
      } else {
        isWaiting = true;
        Future.delayed(const Duration(milliseconds: 1500), () {
          isFrontSide[i] = true;
          isFrontSide[selectedPieceIndex] = true;
          isWaiting = false;
        });
      }
      attempts++;
      alreadySelectedPiece = false;
    }
  }

  dynamic pushToGameOver(int elapsedMilliseconds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GameOver(
                difficulty: widget.difficulty,
                timeInMiliseconds: elapsedMilliseconds,
                numberOfAttempts: attempts)));
  }
}

class CardReplacement extends StatelessWidget {
  final double padding;
  final double height;
  final double width;
  const CardReplacement(
      {Key? key,
      required this.padding,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.transparent)),
        child: SizedBox(
          height: height,
          width: width,
        ),
      ),
    );
  }
}

class BackSideCard extends StatelessWidget {
  const BackSideCard({
    Key? key,
    required this.pexesoItems,
    required this.i,
    required this.padding,
    required this.height,
    required this.width,
  }) : super(key: key);

  final List<PexesoIcon?>? pexesoItems;
  final int i;
  final double padding;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(),
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.7)),
        child: SizedBox(
          width: width,
          height: height,
          child: pexesoItems?[i],
        ),
      ),
    );
  }
}

class FrontSideCard extends StatelessWidget {
  final double padding;
  final double height;
  final double width;
  final double iconSize;
  const FrontSideCard({
    Key? key,
    required this.padding,
    required this.height,
    required this.width,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(),
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.7)),
        child: SizedBox(
          width: width,
          height: height,
          child: Icon(Icons.question_mark, size: iconSize),
        ),
      ),
    );
  }
}

PreferredSize appBar(int lvl, BuildContext context, Stopwatch stopwatch) {
  if (!context.mounted) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(0), child: Container());
  } else {
    return PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            "Level: ${convertLvlToWords(lvl)}",
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
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
                  "Attempts: $attempts",
                  style: appBarStatisticsStats(),
                )
              ],
            ),
          ),
        ));
  }
}

TextStyle appBarStatisticsStats() {
  return const TextStyle(
      color: Colors.white70, fontSize: 24, fontWeight: FontWeight.bold);
}
