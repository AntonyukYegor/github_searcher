import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/components/constants.dart';
import 'package:github_searcher/presentation/features/search/bloc/search_page_event.dart';
import 'package:github_searcher/presentation/features/search/bloc/search_page_state.dart';

class SearchPageBloc extends Bloc<SearchEvent, SearchState> {
  SearchPageBloc() : super(const SearchState(search: '')) {
    on<SearchChangedEvent>(_onSearchChanged);
    on<ResetErrorMessage>(_onResetErrorMessage);
    on<ValidateSearchEvent>(_onValidateSearchEvent);
  }

  void _onSearchChanged(SearchChangedEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(search: event.search));
  }

  void _onResetErrorMessage(
      ResetErrorMessage event, Emitter<SearchState> emit) {
    if (state.errorMessage != null) {
      emit(state.copyWith(errorMessage: null));
    }
  }

  void _onValidateSearchEvent(
      ValidateSearchEvent event, Emitter<SearchState> emit) {
    if (state.search.length < AppConstants.minLettersInRequest) {
      emit(state.copyWith(
          errorMessage: AppConstants.searchRequestValidateErrorMessage));
    } else {
      emit(state.copyWith(errorMessage: null));

      event.onSuccess();
    }
  }
}
