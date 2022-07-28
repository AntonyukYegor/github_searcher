import 'package:equatable/equatable.dart';
import 'package:github_searcher/domain/models/search_github_repositories.dart';

class SearchResultState extends Equatable {
  final Future<SearchGitHubRepositories>? data;
  final int? page;
  final int? perPage;
  final String? search;

  const SearchResultState({
    this.data,
    this.page,
    this.perPage,
    this.search,
  });

  SearchResultState copyWith({
    String? search,
    Future<SearchGitHubRepositories>? data,
    int? page,
    int? perPage,
  }) =>
      SearchResultState(
        data: data ?? this.data,
        search: search ?? this.search,
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
      );

  @override
  List<Object> get props => [data ?? 0];
}
