import 'package:flutter/material.dart';
import 'GroupColors.dart';

import 'Group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Data.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Data {
  Data() {}

  @JsonKey(defaultValue: [])
  List<Group> groups = [];

  @JsonKey()
  ThemeMode theme = ThemeMode.light;

  ValueNotifier<ThemeMode> themeChanger = ValueNotifier(ThemeMode.light);

  Color colorOf(Group group) {
    var index = groups.indexOf(group);
    return GroupColors().getColor(index);
  }

  @override
  String toString() => toJson().toString();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
