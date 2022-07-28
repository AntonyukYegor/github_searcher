import 'package:github_searcher/data/dtos/api_github/api_github_search_repositories_response_dto.dart';
import 'package:github_searcher/data/models/base_github_repo.dart';
import 'package:github_searcher/domain/models/github_repo.dart';

extension ApiGitHubSearchRepositoriesOwnerResponseDTOFromDTOToDomain
    on ApiGitHubSearchRepositoriesRepoResponseDTO {
  GitHubRepo toDomain() {
    return BaseGitHubRepo(
      id: id,
      owner: owner?.name ?? 'Unknow',
      stargazers: stargazers,
      url: url,
      watchers: watchers,
      name: name,
    );
  }
}
