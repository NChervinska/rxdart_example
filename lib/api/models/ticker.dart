import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticker.g.dart';

@immutable
@JsonSerializable()
class Ticker extends Equatable {
  final String id;
  final String name;
  final String symbol;
  final String rank;
  @JsonKey(name: 'price_usd')
  final String priceUsd;
  @JsonKey(name: 'price_btc')
  final String priceBtc;

  const Ticker({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.priceUsd,
    required this.priceBtc,
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
      rank,
      priceUsd,
      priceBtc,
    ];
  }
}
