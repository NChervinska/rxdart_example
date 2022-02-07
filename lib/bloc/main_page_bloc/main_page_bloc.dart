import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart_example/models/ticker.dart';
import 'package:rxdart_example/services/ticker_service.dart';

@injectable
class MainPageBloc {
  final TickerService _tickerService;
  final BehaviorSubject<List<Ticker>> behaviorSubject =
      BehaviorSubject<List<Ticker>>();

  MainPageBloc(this._tickerService);

  Future<void> init() async {
    final tickers = await _tickerService.getTickers();
    behaviorSubject.sink.add(
      tickers.map((e) {
        return Ticker.fromTickerDto(e);
      }).toList(),
    );
  }

  dispose() {
    behaviorSubject.close();
  }
}
