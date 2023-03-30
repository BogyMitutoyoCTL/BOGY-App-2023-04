import 'package:json_annotation/json_annotation.dart';

import 'Category.dart';
import 'Section.dart';

part 'Timer.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Timer {
  Timer({String this.name = ""}) {}

  @JsonKey(defaultValue: [])
  List<Section> sections = [];
  @JsonKey(required: true)
  String name;

  bool isActive = false;
  bool isExpired = false;

  late int activesectionnumber;

  void activate() {
    activesectionnumber = 0;
    isActive = true;
    isExpired = false;
  }

  void deactivate() {
    isActive = false;
    isExpired = false;
    activesectionnumber = -1;
  }

  void expire() {
    isActive = false;
    isExpired = true;
  }

  void nextsection() {
    isActive = true;
    isExpired = false;
    activesectionnumber++;
  }

  late TimerCategory category;

  @override
  String toString() => toJson().toString();

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

  Map<String, dynamic> toJson() => _$TimerToJson(this);
}
