import 'package:github_searcher/domain/models/github_repo.dart';

class SearchGitHubRepositories {
  const SearchGitHubRepositories({
    required int totalPages,
    required List<GitHubRepo> items,
  })  : _totalPages = totalPages,
        _items = items;

  final int _totalPages;

  int get totalPages => _totalPages;

  final List<GitHubRepo> _items;

  List<GitHubRepo> get items => _items;
}
