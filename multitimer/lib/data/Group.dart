import 'Timer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Group.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Group {
  Group({String this.name = ""}) {}

  @JsonKey(defaultValue: [])
  List<Timer> timers = [];

  @JsonKey(required: true)
  String name = "";

  @override
  String toString() => toJson().toString();

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
