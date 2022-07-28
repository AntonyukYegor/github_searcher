import 'dart:collection';
import 'package:github_searcher/data/services/drift/drift_db_github_repos.dart';
import 'package:github_searcher/domain/models/github_repo.dart';
import 'package:github_searcher/domain/repositories/favourites_github_repo_repository.dart';

class DriftFavouritesGitHubRepoRepository
    implements FavouritesGitHubRepoRepository {
  final DriftDBGitHubRepos _service = DriftDBGitHubRepos();
  final HashSet<int> _favouritesFilmsIds = HashSet<int>();

  DriftFavouritesGitHubRepoRepository() {
    _service.onChangedReposDB().listen(_update);
  }

  void _update(List<GitHubRepo> repos) {
    _favouritesFilmsIds.clear();
    for (var repo in repos) {
      _favouritesFilmsIds.add(repo.id);
    }
  }

  @override
  Future<void> insertFavourite(GitHubRepo repo) async {
    await _service.insertRepoDB(repo);
  }

  @override
  bool checkForFavourite(GitHubRepo repo) {
    return checkForFavouriteById(repo.id);
  }

  @override
  bool checkForFavouriteById(int id) {
    return _favouritesFilmsIds.contains(id);
  }

  @override
  Future<void> deleteFavourite(GitHubRepo repo) async {
    await deleteFavouriteById(repo.id);
  }

  @override
  Future<void> deleteFavouriteById(int id) async {
    await _service.deleteRepoDB(id);
  }

  @override
  Stream<List<GitHubRepo>> onChangedFavourites() async* {
    yield* _service.onChangedReposDB();
  }

  @override
  Future<List<GitHubRepo>> onGetAllFavourites() async {
    return _service.getAllReposDB();
  }

  @override
  Future<void> deleteAllFavourites() async {
    await _service.deleteAll();
  }
}
