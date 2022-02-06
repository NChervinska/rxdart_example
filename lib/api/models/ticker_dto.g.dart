// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TickerDto _$TickerDtoFromJson(Map<String, dynamic> json) => TickerDto(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      circulatingSupply: intFromJson(json['circulating_supply'] as String),
      totalSupply: intFromJson(json['total_supply'] as String),
      maxSupply: intFromJson(json['max_supply'] as String),
    );

Map<String, dynamic> _$TickerDtoToJson(TickerDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
    };
