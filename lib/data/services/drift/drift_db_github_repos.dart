import 'package:drift/drift.dart';
import 'package:github_searcher/data/database/database.dart';
import 'package:github_searcher/domain/models/github_repo.dart';
import 'package:github_searcher/data/mappers/drift/github_repo_table_data.dart';

class DriftDBGitHubRepos {
  final Database _db = Database();

  void close() {
    _db.close();
  }

  Future<List<GitHubRepo>> getAllReposDB() async {
    var repoDB = await _db.select(_db.gitHubRepoTable).get();

    return repoDB
        .map((GitHubRepoTableData repoData) => repoData.toDomain())
        .toList();
  }

  Future<void> insertRepoDB(GitHubRepo repo) async {
    await _db.into(_db.gitHubRepoTable).insert(
          repo.toDatabase(),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> deleteRepoDB(int id) async {
    await (_db.delete(_db.gitHubRepoTable)
          ..where((repoTableData) => repoTableData.id.equals(id)))
        .go();
  }

  Future<void> deleteAll() async {
    await _db.delete(_db.gitHubRepoTable).go();
    // await (_db.delete(_db.gitHubRepoTable)).go();//
  }

  Stream<List<GitHubRepo>> onChangedReposDB() {
    return (_db.select(_db.gitHubRepoTable))
        .map((GitHubRepoTableData repoTableData) => repoTableData.toDomain())
        .watch();
  }
}
