// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Timer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timer _$TimerFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name'],
  );
  return Timer(
    name: json['name'] as String? ?? "",
  )..sections = (json['sections'] as List<dynamic>?)
          ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];
}

Map<String, dynamic> _$TimerToJson(Timer instance) => <String, dynamic>{
      'sections': instance.sections.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };
