import 'dart:ui';

import 'TimerCategory.dart';

class CategWidgetData {
  late TimerCategory category;
  late bool editEnabled;
  late void Function(TimerCategory category) delete;
  late Color color;
}
