import 'package:json_annotation/json_annotation.dart';
part 'Section.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Section {
  Section({String this.message = "", Duration this.duration = Duration.zero}) {}

  @JsonKey(required: true)
  Duration duration;
  @JsonKey(required: true)
  String message;

  @override
  String toString() => toJson().toString();

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);
}
