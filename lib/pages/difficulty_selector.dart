import 'package:flutter/material.dart';
import 'package:pexeso_project/pages/home.dart';

import 'start_dialog.dart';

class DifficultySelectorPage extends StatelessWidget {
  const DifficultySelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDifficulty(context),
      body: bodyDifficultySelector(context),
    );
  }

  Container bodyDifficultySelector(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.6),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartDialog(
                                    difficulty: 1,
                                  )));
                    },
                    icon: const Icon(
                      Icons.looks_one_outlined,
                      color: Colors.white70,
                    ),
                    style: const HomePage().btnStyle(context),
                    label: Text(
                      "Easy",
                      style: const HomePage().btnTextStyle(),
                    )),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartDialog(
                                    difficulty: 2,
                                  )));
                    },
                    icon: const Icon(
                      Icons.looks_two_outlined,
                      color: Colors.white70,
                    ),
                    style: const HomePage().btnStyle(context),
                    label: Text(
                      "Medium",
                      style: const HomePage().btnTextStyle(),
                    )),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartDialog(
                                    difficulty: 3,
                                  )));
                    },
                    icon: const Icon(
                      Icons.looks_3_outlined,
                      color: Colors.white70,
                    ),
                    style: const HomePage().btnStyle(context),
                    label: Text(
                      "Hard",
                      style: const HomePage().btnTextStyle(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize appBarDifficulty(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: const Text('Difficulty selector'),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 80,
        ));
  }
}
