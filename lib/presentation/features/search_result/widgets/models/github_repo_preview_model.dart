class GitHubRepoPreviewModel {
  const GitHubRepoPreviewModel({
    required this.id,
    required this.owner,
    required this.name,
    required this.stargazers,
    required this.watchers,
    required this.url,
  });

  final int id;

  final String owner;

  final String name;

  final int stargazers;

  final int watchers;

  final String url;
}