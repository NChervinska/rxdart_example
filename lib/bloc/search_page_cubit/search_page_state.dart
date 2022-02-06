part of 'search_page_cubit.dart';

enum SearchPageStatus {
  success,
  error,
  loading,
}

class SearchPageState implements Equatable {
  final SearchPageStatus status;
  final String error;
  final List<Person> people;

  const SearchPageState({
    this.status = SearchPageStatus.success,
    this.error = '',
    this.people = const [],
  });

  @override
  List<Object?> get props => [people, status, error];

  @override
  bool? get stringify => true;

  SearchPageState copyWith({
    List<Person>? people,
    SearchPageStatus? status,
    String? error,
  }) {
    return SearchPageState(
      people: people ?? this.people,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
