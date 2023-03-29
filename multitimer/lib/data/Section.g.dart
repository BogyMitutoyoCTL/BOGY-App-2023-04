// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['duration', 'message'],
  );
  return Section(
    message: json['message'] as String? ?? "",
    duration: json['duration'] == null
        ? Duration.zero
        : Duration(microseconds: json['duration'] as int),
  );
}

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'duration': instance.duration.inMicroseconds,
      'message': instance.message,
    };
