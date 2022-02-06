// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      people: (json['people'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'people': instance.people,
    };
