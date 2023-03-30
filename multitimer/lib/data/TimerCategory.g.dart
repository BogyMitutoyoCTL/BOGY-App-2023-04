// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimerCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimerCategory _$TimerCategoryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name'],
  );
  return TimerCategory(
    name: json['name'] as String? ?? "",
  )..timers = (json['timers'] as List<dynamic>?)
          ?.map((e) => Timer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];
}

Map<String, dynamic> _$TimerCategoryToJson(TimerCategory instance) =>
    <String, dynamic>{
      'timers': instance.timers.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };
