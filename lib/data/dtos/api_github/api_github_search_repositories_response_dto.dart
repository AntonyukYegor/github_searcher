import 'package:json_annotation/json_annotation.dart';

part 'api_github_search_repositories_response_dto.g.dart';

@JsonSerializable()
class ApiGitHubSearchRepositoriesResponseDTO {
  const ApiGitHubSearchRepositoriesResponseDTO({
    required this.totalCount,
    required this.items,
  });

  @JsonKey(name: 'total_count', defaultValue: 0)
  final int totalCount;

  @JsonKey(name: 'items', defaultValue: [])
  final List<ApiGitHubSearchRepositoriesRepoResponseDTO> items;

  factory ApiGitHubSearchRepositoriesResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$ApiGitHubSearchRepositoriesResponseDTOFromJson(json);
}

@JsonSerializable()
class ApiGitHubSearchRepositoriesOwnerResponseDTO {
  const ApiGitHubSearchRepositoriesOwnerResponseDTO({required this.name});

  @JsonKey(name: 'login', defaultValue: '')
  final String name;

  factory ApiGitHubSearchRepositoriesOwnerResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$ApiGitHubSearchRepositoriesOwnerResponseDTOFromJson(json);
}

@JsonSerializable()
class ApiGitHubSearchRepositoriesRepoResponseDTO {
  const ApiGitHubSearchRepositoriesRepoResponseDTO({
    required this.id,
    required this.name,
    required this.watchers,
    required this.stargazers,
    required this.owner,
    required this.url,
  });

  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'html_url', defaultValue: '')
  final String url;

  @JsonKey(name: 'stargazers_count', defaultValue: 0)
  final int stargazers;

  @JsonKey(name: 'watchers_count', defaultValue: 0)
  final int watchers;

  @JsonKey(name: 'owner')
  final ApiGitHubSearchRepositoriesOwnerResponseDTO? owner;

  factory ApiGitHubSearchRepositoriesRepoResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$ApiGitHubSearchRepositoriesRepoResponseDTOFromJson(json);
}
