// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as String,
      name: json['name'] as String,
      cout: json['teams_count'] as int,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teams_count': instance.cout,
    };
