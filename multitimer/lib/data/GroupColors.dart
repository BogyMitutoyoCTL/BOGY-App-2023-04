import 'package:flutter/material.dart';

class GroupColors {
  List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.deepPurple
  ];

  Color getColor(int index) {
    return _colors[index % _colors.length];
  }
}
