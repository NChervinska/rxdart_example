import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart_example/api/models/ticker.dart';
import 'package:rxdart_example/services/ticker_service.dart';

import '../base_cubit.dart';

part 'main_page_state.dart';

@injectable
class MainPageCubit extends BaseCubit<MainPageState> {
  final TickerService _tickerService;

  MainPageCubit(this._tickerService) : super(const MainPageState()) {
    init();
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: MainPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    await makeErrorHandledCall(() async {
      emit(state.copyWith(status: MainPageStatus.loading));

      final tickers = await _tickerService.getTickers();
      emit(state.copyWith(
        status: MainPageStatus.success,
        tickers: tickers,
      ));
    });
  }
}
