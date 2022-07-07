import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rxdart_example/models/person.dart';

part 'people.g.dart';

@immutable
@JsonSerializable()
class People extends Equatable {
  final List<Person> people;

  const People({required this.people});

  factory People.fromJson(Map<String, dynamic> json) {
    return _$PeopleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PeopleToJson(this);

  @override
  List<Object> get props => [people];
}
