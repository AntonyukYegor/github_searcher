import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final String search;
  final String? errorMessage;

  const SearchState({
    this.errorMessage,
    required this.search,
  });

  SearchState copyWith({
    String? search,
    String? errorMessage,
  }) =>
      SearchState(
        errorMessage: errorMessage,
        search: search ?? this.search,
      );

  @override
  List<Object> get props => [errorMessage ?? '', search];
}
