import 'package:dio/dio.dart';
import 'package:github_searcher/data/dtos/api_github/api_github_search_repositories_response_dto.dart';
import 'package:github_searcher/data/repositories/dio/interceptors/dio_error_interceptor.dart';
import 'package:github_searcher/domain/models/repo_sort_and_order.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiGitHubService {
  late final Dio _dio = Dio()
    ..interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
      ErrorInterceptor(_onErrorHandler),
    ]);

  final Function(String, String) _onErrorHandler;

  static const _baseURL = 'https://api.github.com/search/repositories?';

  ApiGitHubService({required Function(String, String) onErrorHandler})
      : _onErrorHandler = onErrorHandler;

  Future<ApiGitHubSearchRepositoriesResponseDTO> searchRepositories(
      {required String searchQuery,
      int page = 1,
      required int perPage,
      RepoSortAndOrder sortAndRepo = RepoSortAndOrder.none}) async {
    String url = '$_baseURL&type=movie';
    final Response<dynamic> response = await _dio.get<dynamic>(
      url,
      queryParameters: <String, dynamic>{
        'page': page,
        'q': searchQuery,
        'per_page': perPage,
      },
    );
    return ApiGitHubSearchRepositoriesResponseDTO.fromJson(response.data);
  }
}
