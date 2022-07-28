import 'package:github_searcher/data/database/database.dart';
import 'package:github_searcher/data/models/base_github_repo.dart';
import 'package:github_searcher/domain/models/github_repo.dart';

extension GitHubRepoToTableData on GitHubRepo {
  GitHubRepoTableData toDatabase() {
    return GitHubRepoTableData(
      id: id,
      owner: owner,
      name: name,
      url: url,
      stargazers: stargazers,
      watchers: watchers,
    );
  }
}

extension GitHubRepoTableDataToDomain on GitHubRepoTableData {
  GitHubRepo toDomain() {
    return BaseGitHubRepo(
      id: id,
      owner: owner,
      name: name,
      url: url,
      stargazers: stargazers,
      watchers: watchers,
    );
  }
}
