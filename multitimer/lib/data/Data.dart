import 'package:flutter/material.dart';
import 'GroupColors.dart';

import 'Group.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Timer.dart';

part 'Data.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Data {
  ValueNotifier<Color> appBarColor = ValueNotifier(Colors.red);

  Data() {}

  @JsonKey(defaultValue: [])
  List<Group> groups = [];

  @JsonKey()
  ThemeMode theme = ThemeMode.light;

  ValueNotifier<ThemeMode> themeChanger = ValueNotifier(ThemeMode.light);

  List<Timer> getActiveTimers() {
    List<Timer> activeTimers = [];
    for (var group = 0; group < groups.length; ++group) {
      for (var timer = 0; timer < groups[group].timers.length; timer++) {
        if (groups[group].timers[timer].isActive) {
          activeTimers.add(groups[group].timers[timer]);
        }
      }
    }
    return activeTimers;
  }

  Color colorOf(Group group) {
    var index = groups.indexOf(group);
    return GroupColors().getColor(index);
  }

  @override
  String toString() => toJson().toString();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
