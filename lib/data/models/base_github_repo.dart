import 'package:github_searcher/domain/models/github_repo.dart';

class BaseGitHubRepo implements GitHubRepo {
  const BaseGitHubRepo({
    required int id,
    required String owner,
    required String name,
    required String url,
    required int stargazers,
    required int watchers,
  })  : _id = id,
        _owner = owner,
        _name = name,
        _url = url,
        _stargazers = stargazers,
        _watchers = watchers;

  final String _url;

  @override
  String get url => _url;

  final int _id;

  @override
  int get id => _id;

  final String _owner;

  @override
  String get owner => _owner;

  final String _name;

  @override
  String get name => _name;

  final int _stargazers;

  @override
  int get stargazers => _stargazers;

  final int _watchers;

  @override
  int get watchers => _watchers;
}
