// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name'],
  );
  return Group(
    name: json['name'] as String? ?? "",
  )..timers = (json['timers'] as List<dynamic>?)
          ?.map((e) => Timer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'timers': instance.timers.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };
