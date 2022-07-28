import 'package:equatable/equatable.dart';
import 'package:github_searcher/domain/models/github_repo.dart';

class FavouritesState extends Equatable {
  final List<GitHubRepo> repos;

  const FavouritesState({
    required this.repos,
  });

  FavouritesState copyWith({
    List<GitHubRepo>? repos,
  }) =>
      FavouritesState(
        repos: repos ?? this.repos,
      );

  @override
  List<Object> get props => [
        repos,
      ];
}
