import 'package:github_searcher/data/models/base_github_repo.dart';
import 'package:github_searcher/domain/models/github_repo.dart';
import 'package:github_searcher/presentation/features/search_result/widgets/models/github_repo_preview_model.dart';

extension GitHubRepoToGitHubRepoPreviewModel on GitHubRepo {
  GitHubRepoPreviewModel toGitHubRepoPreviewModel() => GitHubRepoPreviewModel(
        id: id,
        owner: owner,
        name: name,
        stargazers: stargazers,
        watchers: watchers,
        url: url,
      );
}

extension GitHubRepoPreviewModelToDomain on GitHubRepoPreviewModel {
  GitHubRepo toDomain() => BaseGitHubRepo(
        id: id,
        owner: owner,
        name: name,
        stargazers: stargazers,
        watchers: watchers,
        url: url,
      );
}
