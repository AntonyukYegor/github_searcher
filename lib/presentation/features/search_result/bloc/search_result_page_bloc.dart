import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/domain/models/repo_sort_and_order.dart';
import 'package:github_searcher/domain/repositories/github_repo_repository.dart';
import 'package:github_searcher/presentation/features/search/bloc/search_page_bloc.dart';
import 'package:github_searcher/presentation/features/search_result/bloc/search_result_page_event.dart';
import 'package:github_searcher/presentation/features/search_result/bloc/search_result_page_state.dart';

class SearchResultPageBloc extends Bloc<SearchResultEvent, SearchResultState> {
  final GitHubRepoRepository _repository;

  final SearchPageBloc _searchPageBloc;

  SearchResultPageBloc({
    required GitHubRepoRepository repository,
    required SearchPageBloc searchPageBloc,
  })  : _repository = repository,
        _searchPageBloc = searchPageBloc,
        super(const SearchResultState(page: 1, perPage: 50)) {
    on<LoadDataEvent>(_onLoadData);
    on<NextPageLoadEvent>(_onNextPageLoad);
    on<PrevPageLoadEvent>(_onPrevPageLoad);
  }

  void _onLoadData(LoadDataEvent event, Emitter<SearchResultState> emit) {
    emit(state.copyWith(
        data: _repository.getGitHubRepos(_searchPageBloc.state.search,
            state.page, state.perPage ?? 50, RepoSortAndOrder.none)));
  }

  FutureOr<void> _onNextPageLoad(
      NextPageLoadEvent event, Emitter<SearchResultState> emit) async {
    final data = await state.data;
    var totalCount = data?.totalPages ?? 1;

    if (state.page < totalCount) {
      emit(state.copyWith(
          page: state.page + 1,
          data: _repository.getGitHubRepos(_searchPageBloc.state.search,
              state.page + 1, state.perPage ?? 50, RepoSortAndOrder.none)));
    }
  }

  FutureOr<void> _onPrevPageLoad(
      PrevPageLoadEvent event, Emitter<SearchResultState> emit) {
    if (state.page > 1) {
      emit(state.copyWith(
          page: state.page - 1,
          data: _repository.getGitHubRepos(_searchPageBloc.state.search,
              state.page - 1, state.perPage ?? 50, RepoSortAndOrder.none)));
    }
  }
}
