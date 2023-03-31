import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'TimerCategory.dart';
import 'GroupColors.dart';
import 'Timer.dart';

part 'Data.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Data {
  @JsonKey(defaultValue: [])
  List<TimerCategory> categories = [];

  @JsonKey(required: true)
  ThemeMode theme = ThemeMode.light;

  @JsonKey(includeToJson: false, includeFromJson: false)
  Color appBarColor = Colors.red;

  @JsonKey(includeToJson: false, includeFromJson: false)
  late ValueNotifier<Color> appBarColorChanger;

  @JsonKey(includeToJson: false, includeFromJson: false)
  late ValueNotifier<ThemeMode> themeChanger;

  Data() {
    appBarColorChanger = ValueNotifier(appBarColor);
    themeChanger = ValueNotifier(theme);
  }

  List<Timer> getActiveTimers() {
    return filterTimers((Timer timer) => timer.isActive);
  }

  List<Timer> filterTimers(bool Function(Timer timer) filter) {
    List<Timer> activeTimers = [];
    for (var category in categories) {
      for (var timer in category.timers) {
        if (filter(timer)) {
          timer.category = category;
          activeTimers.add(timer);
        }
      }
    }
    return activeTimers;
  }

  List<Timer> getExpiredTimers() {
    return filterTimers((timer) => timer.isExpired);
  }

  Color colorOf(TimerCategory group) {
    var index = categories.indexOf(group);
    return GroupColors().getColor(index);
  }

  @override
  String toString() => toJson().toString();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
