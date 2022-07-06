import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rxdart_example/utils/json_utils.dart';

part 'ticker.g.dart';

@immutable
@JsonSerializable()
class Ticker extends Equatable {
  final String id;
  final String name;
  final String symbol;
  @JsonKey(
    name: 'max_supply',
    fromJson: intFromJson,
  )
  final int maxSupply;

  const Ticker({
    required this.id,
    required this.name,
    required this.symbol,
    required this.maxSupply,
  });

  factory Ticker.fromJson(Map<String, dynamic> json) {
    return _$TickerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TickerToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      name,
      symbol,
      maxSupply,
    ];
  }
}
