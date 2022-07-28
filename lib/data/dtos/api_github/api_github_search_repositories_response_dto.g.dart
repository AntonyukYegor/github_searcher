// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_github_search_repositories_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGitHubSearchRepositoriesResponseDTO
    _$ApiGitHubSearchRepositoriesResponseDTOFromJson(
            Map<String, dynamic> json) =>
        ApiGitHubSearchRepositoriesResponseDTO(
          totalCount: json['total_count'] as int? ?? 0,
          items: (json['items'] as List<dynamic>?)
                  ?.map((e) =>
                      ApiGitHubSearchRepositoriesRepoResponseDTO.fromJson(
                          e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiGitHubSearchRepositoriesResponseDTOToJson(
        ApiGitHubSearchRepositoriesResponseDTO instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'items': instance.items,
    };

ApiGitHubSearchRepositoriesOwnerResponseDTO
    _$ApiGitHubSearchRepositoriesOwnerResponseDTOFromJson(
            Map<String, dynamic> json) =>
        ApiGitHubSearchRepositoriesOwnerResponseDTO(
          name: json['login'] as String? ?? '',
        );

Map<String, dynamic> _$ApiGitHubSearchRepositoriesOwnerResponseDTOToJson(
        ApiGitHubSearchRepositoriesOwnerResponseDTO instance) =>
    <String, dynamic>{
      'login': instance.name,
    };

ApiGitHubSearchRepositoriesRepoResponseDTO
    _$ApiGitHubSearchRepositoriesRepoResponseDTOFromJson(
            Map<String, dynamic> json) =>
        ApiGitHubSearchRepositoriesRepoResponseDTO(
          id: json['id'] as int? ?? 0,
          name: json['name'] as String? ?? '',
          watchers: json['watchers_count'] as int? ?? 0,
          stargazers: json['stargazers_count'] as int? ?? 0,
          owner: json['owner'] == null
              ? null
              : ApiGitHubSearchRepositoriesOwnerResponseDTO.fromJson(
                  json['owner'] as Map<String, dynamic>),
          url: json['html_url'] as String? ?? '',
        );

Map<String, dynamic> _$ApiGitHubSearchRepositoriesRepoResponseDTOToJson(
        ApiGitHubSearchRepositoriesRepoResponseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'html_url': instance.url,
      'stargazers_count': instance.stargazers,
      'watchers_count': instance.watchers,
      'owner': instance.owner,
    };
