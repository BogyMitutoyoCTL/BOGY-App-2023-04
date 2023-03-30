import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Category.dart';
import 'GroupColors.dart';
import 'Timer.dart';

part 'Data.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Data {
  @JsonKey(defaultValue: [])
  List<Category> categories = [];

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
    List<Timer> activeTimers = [];
    for (var category = 0; category < categories.length; ++category) {
      for (var timer = 0; timer < categories[category].timers.length; timer++) {
        if (categories[category].timers[timer].isActive) {
          activeTimers.add(categories[category].timers[timer]);
        }
      }
    }
    return activeTimers;
  }

  List<Timer> getExpiredTimers() {
    List<Timer> expiredTimers = [];
    for (var c = 0; c < categories.length; ++c) {
      var category = categories[c];
      for (var t = 0; t < category.timers.length; t++) {
        var timer = category.timers[t];
        timer.category = category;
        if (timer.isExpired) {
          expiredTimers.add(timer);
        }
      }
    }
    return expiredTimers;
  }

  Color colorOf(Category group) {
    var index = categories.indexOf(group);
    return GroupColors().getColor(index);
  }

  @override
  String toString() => toJson().toString();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
