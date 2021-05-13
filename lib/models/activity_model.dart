import 'package:flutter/material.dart';

import '../constants.dart';

class Activity {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final String hint;
  final Function onTap;

  Activity(this.icon, this.iconColor, this.iconSize, this.hint, this.onTap);
}

Activity addNote = Activity(
  Icons.add,
  kSecondaryColor,
  36.0,
  "Add new note",
  () {
    print("ADDING AN ACTIVITY");
  },
);

Activity share = Activity(
  Icons.share,
  kSecondaryColor,
  36.0,
  "Share",
  () {
    print("SHARING AN ACTIVITY");
  },
);

Activity toggleFavorite = Activity(
  Icons.favorite,
  kSecondaryColor,
  36.0,
  "Add to your favorites",
  () {
    print("TOGGLE AN ACTIVITY FAVORITE STATUS");
  },
);

Activity info = Activity(
  Icons.info_outline,
  kPastelBlueHighlight,
  36.0,
  "Info",
  () {
    print("SHOW SOME INFO");
  },
);
