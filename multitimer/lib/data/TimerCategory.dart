import 'package:json_annotation/json_annotation.dart';

import 'Timer.dart';

part 'TimerCategory.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class TimerCategory {
  TimerCategory({String this.name = ""}) {}

  @JsonKey(defaultValue: [])
  List<Timer> timers = [];

  @JsonKey(required: true)
  String name = "";

  @override
  String toString() => toJson().toString();

  factory TimerCategory.fromJson(Map<String, dynamic> json) =>
      _$TimerCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$TimerCategoryToJson(this);
}
