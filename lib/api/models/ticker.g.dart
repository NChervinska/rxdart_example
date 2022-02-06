// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticker _$TickerFromJson(Map<String, dynamic> json) => Ticker(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      rank: json['rank'] as String,
      priceUsd: json['price_usd'] as String,
      priceBtc: json['price_btc'] as String,
    );

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'rank': instance.rank,
      'price_usd': instance.priceUsd,
      'price_btc': instance.priceBtc,
    };
