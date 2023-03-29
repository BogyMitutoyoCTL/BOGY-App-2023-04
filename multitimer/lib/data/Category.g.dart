// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name'],
  );
  return Category(
    name: json['name'] as String? ?? "",
  )..timers = (json['timers'] as List<dynamic>?)
          ?.map((e) => Timer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'timers': instance.timers.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };
