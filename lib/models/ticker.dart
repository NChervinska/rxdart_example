import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart_example/api/models/ticker_dto.dart';

class Ticker extends Equatable {
  final String name;
  final String symbol;
  final int supply;

  const Ticker({
    required this.name,
    required this.symbol,
    required this.supply,
  });

  factory Ticker.fromTickerDto(TickerDto tickerDto) {
    final supply = tickerDto.maxSupply +
        tickerDto.circulatingSupply +
        tickerDto.totalSupply;

    return Ticker(
      name: tickerDto.name,
      symbol: tickerDto.symbol,
      supply: supply ~/ 3,
    );
  }

  @override
  List<Object> get props {
    return [symbol, name, supply];
  }
}

extension TickerExt on Ticker {
  Widget getWidget(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Divider(),
          Text(symbol),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(name),
              Text(supply.toString()),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
