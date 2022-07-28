import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/domain/repositories/favourites_github_repo_repository.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final FavouritesGitHubRepoRepository _repository;

  FavouritesBloc({
    required FavouritesGitHubRepoRepository repository,
  })  : _repository = repository,
        super(const FavouritesState(repos: [])) {
    on<ChangedFavourite>(_onChangedFavourite);
    on<ChangedFavourites>(_onChangedFavourites);
    on<ClearFavourites>(_onClearFavourites);
    _repository.onChangedFavourites().listen((event) {
      add(ChangedFavourites(models: event));
    });
  }

  void _onChangedFavourite(
      ChangedFavourite event, Emitter<FavouritesState> emit) {
    final domainModel = event.model;

    if (_repository.checkForFavourite(domainModel)) {
      _repository.deleteFavourite(domainModel);
    } else {
      _repository.insertFavourite(domainModel);
    }
  }

  FutureOr<void> _onChangedFavourites(
      ChangedFavourites event, Emitter<FavouritesState> emit) {
    emit(state.copyWith(repos: event.models));
  }

  FutureOr<void> _onClearFavourites(
      ClearFavourites event, Emitter<FavouritesState> emit) async {
    await _repository.deleteAllFavourites();
  }
}
