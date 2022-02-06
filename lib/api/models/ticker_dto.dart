import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rxdart_example/utils/json_utils.dart';

part 'ticker_dto.g.dart';

@immutable
@JsonSerializable()
class TickerDto extends Equatable {
  final String id;
  final String name;
  final String symbol;
  @JsonKey(
    name: 'circulating_supply',
    fromJson: intFromJson,
  )
  final int circulatingSupply;
  @JsonKey(
    name: 'total_supply',
    fromJson: intFromJson,
  )
  final int totalSupply;
  @JsonKey(
    name: 'max_supply',
    fromJson: intFromJson,
  )
  final int maxSupply;

  const TickerDto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
  });

  factory TickerDto.fromJson(Map<String, dynamic> json) {
    return _$TickerDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TickerDtoToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      name,
      symbol,
      circulatingSupply,
      totalSupply,
      maxSupply,
    ];
  }
}
