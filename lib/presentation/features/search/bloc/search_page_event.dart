
import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchChangedEvent extends SearchEvent {
  final String search;

  const SearchChangedEvent({required this.search});

  @override
  List<Object> get props => [search];
}


class ValidateSearchEvent extends SearchEvent {
  final Function() onSuccess;

  const ValidateSearchEvent({required this.onSuccess});

  @override
  List<Object> get props => [onSuccess];
}

class ResetErrorMessage extends SearchEvent {}