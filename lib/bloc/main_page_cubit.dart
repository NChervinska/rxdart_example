import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart_example/api/models/ticker.dart';
import 'package:rxdart_example/services/ticker_service.dart';

import 'base_cubit.dart';

class MainPageState implements Equatable {
  final BehaviorSubject<List<Ticker>> tickers = BehaviorSubject<List<Ticker>>();

  @override
  List<Object?> get props => [tickers];

  @override
  bool? get stringify => true;
}

@injectable
class MainPageCubit extends BaseCubit<MainPageState> {
  final TickerService _tickerService;

  MainPageCubit(this._tickerService) : super(MainPageState()) {
    init();
  }

  @override
  void handleError(String errorMessage) {
    state.tickers.addError(errorMessage);
  }

  Future<void> init() async {
    await makeErrorHandledCall(() async {
      final tickers = await _tickerService.getTickers();
      state.tickers.sink.add(tickers);
    });
  }
}
