import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart_example/models/person.dart';
import 'package:rxdart_example/services/ticker_service.dart';

import '../base_cubit.dart';

part 'search_page_state.dart';

@injectable
class SearchPageCubit extends BaseCubit<SearchPageState> {
  final TickerService _tickerService;

  SearchPageCubit(this._tickerService) : super(const SearchPageState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: SearchPageStatus.error,
      error: errorMessage,
    ));
  }

  Future<void> search(String query) async {
    if (query.trim().isEmpty) return;

    await makeErrorHandledCall(() async {
      emit(state.copyWith(status: SearchPageStatus.loading));

      await Future.delayed(Duration(seconds: Random().nextInt(5)));

      final people = await _tickerService.getPeople(query);
      emit(state.copyWith(
        status: SearchPageStatus.success,
        people: people.people,
      ));
    });
  }
}
