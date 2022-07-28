import 'package:github_searcher/domain/models/repo_sort_and_order.dart';
import 'package:github_searcher/domain/models/search_github_repositories.dart';

abstract class GitHubRepoRepository {
  Future<SearchGitHubRepositories> getGitHubRepos(
    String q,
    int page,
    int perPage,
    RepoSortAndOrder sortAndOrder,
  );
}
