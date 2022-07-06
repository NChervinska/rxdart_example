import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@immutable
@JsonSerializable()
class Person extends Equatable {
  final String id;
  final String name;
  @JsonKey(name: 'teams_count')
  final int cout;

  const Person({
    required this.id,
    required this.name,
    required this.cout,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return _$PersonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  List<Object> get props {
    return [id, name, cout];
  }
}
