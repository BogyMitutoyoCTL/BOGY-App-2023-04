import 'dart:ui';

import 'package:multitimer/data/Data.dart';

import 'Timer.dart';

class TimerTileData {
  late void Function() refresh;
  late Timer timer;
  late Color color;

  late Data data;
}
