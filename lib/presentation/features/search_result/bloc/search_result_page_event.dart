import 'package:equatable/equatable.dart';

abstract class SearchResultEvent extends Equatable {
  const SearchResultEvent();

  @override
  List<Object> get props => [];
}

class ItemPerPageChangedEvent extends SearchResultEvent {
  final int perPage;

  const ItemPerPageChangedEvent({required this.perPage});

  @override
  List<Object> get props => [perPage];
}

class PageChangedEvent extends SearchResultEvent {
  final int page;

  const PageChangedEvent({required this.page});

  @override
  List<Object> get props => [page];
}

class NextPageLoadEvent extends SearchResultEvent {}
class PrevPageLoadEvent extends SearchResultEvent {}

class LoadDataEvent extends SearchResultEvent {}
