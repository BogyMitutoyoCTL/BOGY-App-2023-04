import 'package:json_annotation/json_annotation.dart';

import 'Section.dart';

part 'Timer.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Timer {
  Timer({String this.name = ""}) {}

  @JsonKey(defaultValue: [])
  List<Section> sections = [Section()];
  @JsonKey(required: true)
  String name;

  bool isActive = false;

  @override
  String toString() => toJson().toString();

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

  Map<String, dynamic> toJson() => _$TimerToJson(this);
}
