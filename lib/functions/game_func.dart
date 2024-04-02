import 'package:flutter/material.dart';

const double iconSizeEasy = 80;
const double iconSizeMedium = 60;
const double iconSizeHard = 40;

const List<PexesoIcon> iconsList = [
  PexesoIcon(
    currentIcon: Icons.computer,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.toys,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.alarm,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.adf_scanner,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.airplanemode_active,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.photo_camera,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.backpack,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.iron,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.discord,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.bike_scooter,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.flag,
    iconSize: null,
  ),
  PexesoIcon(
    currentIcon: Icons.headphones,
    iconSize: null,
  ),
];

class PexesoIcon extends StatelessWidget {
  final IconData? currentIcon;
  final double? iconSize;
  const PexesoIcon(
      {Key? key, required this.currentIcon, required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(currentIcon, size: iconSize);
  }
} // 12 ikon

Map<Icon, int>? createIconsMap(int? difficulty) {
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

List<PexesoIcon?> createRandomList(int? difficulty) {
  List<PexesoIcon?> possibleIcons = List.from(iconsList);
  possibleIcons.shuffle();
  List<PexesoIcon?> randomList;
  switch (difficulty) {
    case 1:
      randomList = possibleIcons.sublist(0, 6);
      randomList = randomList + randomList;
      randomList.shuffle();
      for (var i = 0; i < randomList.length; i++) {}
      return randomList
          .map((icon) => PexesoIcon(
              currentIcon: icon?.currentIcon, iconSize: iconSizeEasy))
          .toList();
    case 2:
      randomList = possibleIcons.sublist(0, 8);
      randomList = randomList + randomList;
      randomList.shuffle();
      return randomList
          .map((icon) => PexesoIcon(
              currentIcon: icon?.currentIcon, iconSize: iconSizeMedium))
          .toList();
    case 3:
      randomList = possibleIcons;
      randomList = randomList + randomList;
      randomList.shuffle();
      return randomList
          .map((icon) => PexesoIcon(
              currentIcon: icon?.currentIcon, iconSize: iconSizeHard))
          .toList();
    default:
      return [];
  }
}

bool isEveryElementSame(List? elementList, var element) {
  for (int i = 0; i < elementList!.length; i++) {
    if (elementList[i] != element) {
      return false;
    }
  }
  return true;
}

List<bool> createBoolList(List<PexesoIcon?>? listIcons) {
  List<bool> booleanList = [];
  for (int i = 0; i < listIcons!.length; i++) {
    booleanList.add(true);
  }
  return booleanList;
}

String convertLvlToWords(int lvl) {
  switch (lvl) {
    case 1:
      return "Easy";
    case 2:
      return "Medium";
    case 3:
      return "Hard";
    default:
      return "None";
  }
}
