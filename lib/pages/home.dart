import 'package:flutter/material.dart';
import 'package:pexeso_project/widgets/appbar_const.dart';

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
      color: Theme.of(context).colorScheme.primary.withOpacity(.6),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO add own icons
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/difficulty');
                  },
                  label: Text("PLAY", style: btnTextStyle()),
                  icon: const Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                  ),
                  style: btnStyle(context)),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/scoreboard');
                  },
                  label: Text("Scoreboard", style: btnTextStyle()),
                  icon: const Icon(
                    Icons.score_outlined,
                    color: Colors.white,
                  ),
                  style: btnStyle(context)),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                label: Text("Settings", style: btnTextStyle()),
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
                style: btnStyle(context),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                // Would say this is button to page what will be little troll
                onPressed: () {},
                label: Text("Author", style: btnTextStyle()),
                icon: const Icon(
                  Icons.person_2_outlined,
                  color: Colors.white,
                ),
                style: btnStyle(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle btnTextStyle() {
    return const TextStyle(
        fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white);
  }

  ButtonStyle btnStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
          Theme.of(context).primaryColor.withAlpha(156)),
      iconSize: MaterialStateProperty.all(60),
      fixedSize: MaterialStateProperty.all(
        const Size(300, 125),
      ),
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: const Text("Pexeso game"),
          titleTextStyle: appbarTitleStyle(),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 80,
        ));
  }
}
