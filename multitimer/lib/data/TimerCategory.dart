import 'package:json_annotation/json_annotation.dart';

import 'Timer.dart';

part 'TimerCategory.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class TimerCategory {
  static TimerCategory empty = TimerCategory();

  TimerCategory({String this.name = ""}) {}

  @JsonKey(defaultValue: [])
  List<Timer> timers = [];

  @JsonKey(required: true)
  String name = "";

  List<Timer> getStartableTimers() {
    return filterTimers((Timer timer) => !timer.isActive);
  }

  List<Timer> filterTimers(bool Function(Timer timer) filter) {
    List<Timer> filtered = [];
    for (var timer in timers) {
      if (filter(timer)) {
        timer.category = this;
        filtered.add(timer);
      }
    }
    return filtered;
  }

  @override
  String toString() => toJson().toString();

  factory TimerCategory.fromJson(Map<String, dynamic> json) =>
      _$TimerCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$TimerCategoryToJson(this);
}
