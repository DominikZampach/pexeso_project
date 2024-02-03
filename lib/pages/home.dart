import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: homepageBody(context),
    );
  }

  Container homepageBody(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.6),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO add own icons
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text("PLAY",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70)),
                icon: const Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white70,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor.withAlpha(156)),
                  iconSize: MaterialStateProperty.all(60),
                  fixedSize: MaterialStateProperty.all(
                    const Size(300, 125),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text("Scoreboard",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70)),
                icon: const Icon(
                  Icons.score_outlined,
                  color: Colors.white70,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor.withAlpha(156)),
                  iconSize: MaterialStateProperty.all(60),
                  fixedSize: MaterialStateProperty.all(
                    const Size(300, 125),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                label: const Text("Settings",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70)),
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white70,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor.withAlpha(156)),
                  iconSize: MaterialStateProperty.all(60),
                  fixedSize: MaterialStateProperty.all(
                    const Size(300, 125),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text("Author",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70)),
                icon: const Icon(
                  Icons.person_2_outlined,
                  color: Colors.white70,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor.withAlpha(156)),
                  iconSize: MaterialStateProperty.all(60),
                  fixedSize: MaterialStateProperty.all(
                    const Size(300, 125),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text("Pexeso game"),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
