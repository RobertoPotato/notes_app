import 'package:flutter/material.dart';

class Activity {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final String hint;
  final Function onTap;

  Activity(this.icon, this.iconColor, this.iconSize, this.hint, this.onTap);
}