import 'package:equatable/equatable.dart';
import 'package:github_searcher/domain/models/github_repo.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class ChangedFavourite extends FavouritesEvent {
  final GitHubRepo model;

  const ChangedFavourite({required this.model});
}

class ChangedFavourites extends FavouritesEvent {
  final List<GitHubRepo> models;

  const ChangedFavourites({required this.models});
}

class ClearFavourites extends FavouritesEvent {}
