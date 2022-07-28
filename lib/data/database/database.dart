import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:github_searcher/data/database/tables/github_repo_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';
@DriftDatabase(tables: [GitHubRepoTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
  }

  Future<int> reposCount() async {
    var countExp = gitHubRepoTable.id.count();
    final query = selectOnly(gitHubRepoTable)..addColumns([countExp]);
    var result = await query.map((row) => row.read(countExp)).getSingle();
    return result;
  }

}