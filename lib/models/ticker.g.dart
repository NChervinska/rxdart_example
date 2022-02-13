// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticker _$TickerFromJson(Map<String, dynamic> json) => Ticker(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      maxSupply: intFromJson(json['max_supply'] as String),
    );

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'max_supply': instance.maxSupply,
    };
