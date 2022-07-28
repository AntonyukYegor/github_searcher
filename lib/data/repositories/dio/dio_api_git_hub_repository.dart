import 'dart:math';
import 'package:github_searcher/data/mappers/api_github/api_github_search_repositories_response_from_dto_to_domain.dart';
import 'package:github_searcher/data/services/dio/api_github_service.dart';
import 'package:github_searcher/domain/models/repo_sort_and_order.dart';
import 'package:github_searcher/domain/models/search_github_repositories.dart';
import 'package:github_searcher/domain/repositories/github_repo_repository.dart';

class DioApiGitHubRepository implements GitHubRepoRepository {
  const DioApiGitHubRepository({required ApiGitHubService apiGitHubService})
      : _apiGitHubService = apiGitHubService;
  final ApiGitHubService _apiGitHubService;

  @override
  Future<SearchGitHubRepositories> getGitHubRepos(
      String q, int page, int perPage, RepoSortAndOrder sortAndOrder) async {
    var response = await _apiGitHubService.searchRepositories(
        searchQuery: q, page: page, perPage: perPage);

    return SearchGitHubRepositories(
      totalPages: (min(response.totalCount, 1000) / perPage).floor(),
      items: response.items.map((e) => e.toDomain()).toList(),
    );
  }
}
