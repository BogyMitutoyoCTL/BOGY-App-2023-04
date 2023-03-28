import 'Group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Data.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Data {
  Data() {}

  @JsonKey(defaultValue: [])
  List<Group> groups = [];

  @override
  String toString() => toJson().toString();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
