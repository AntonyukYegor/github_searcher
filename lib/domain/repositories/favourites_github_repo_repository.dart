import 'package:github_searcher/domain/models/github_repo.dart';

abstract class FavouritesGitHubRepoRepository {
  Future<void> deleteFavourite(GitHubRepo repo);
  Future<void> deleteAllFavourites();

  Future<void> deleteFavouriteById(int id);

  Future<void> insertFavourite(GitHubRepo repo);

  bool checkForFavouriteById(int id);

  bool checkForFavourite(GitHubRepo repo);

  Stream<List<GitHubRepo>> onChangedFavourites();

  Future<List<GitHubRepo>> onGetAllFavourites();
}
