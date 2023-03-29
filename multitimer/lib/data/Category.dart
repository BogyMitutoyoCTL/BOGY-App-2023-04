import 'Timer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Category.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Category {
  Category({String this.name = ""}) {}

  @JsonKey(defaultValue: [])
  List<Timer> timers = [];

  @JsonKey(required: true)
  String name = "";

  @override
  String toString() => toJson().toString();

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
