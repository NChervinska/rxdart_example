part of 'main_page_cubit.dart';

enum MainPageStatus {
  success,
  loading,
  error,
}

@immutable
class MainPageState extends Equatable {
  final MainPageStatus status;
  final String errorMessage;
  final List<Ticker> tickers;

  const MainPageState({
    this.status = MainPageStatus.success,
    this.errorMessage = '',
    this.tickers = const [],
  });

  MainPageState copyWith({
    MainPageStatus? status,
    String? errorMessage,
    List<Ticker>? tickers,
  }) {
    return MainPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      tickers: tickers ?? this.tickers,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
        tickers,
      ];
}
