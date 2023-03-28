// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..groups = (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..theme = $enumDecode(_$ThemeModeEnumMap, json['theme']);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'groups': instance.groups.map((e) => e.toJson()).toList(),
      'theme': _$ThemeModeEnumMap[instance.theme]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
