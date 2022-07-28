import 'package:drift/drift.dart';

class GitHubRepoTable extends Table {
  @override
  Set<Column<dynamic>> get primaryKey => <IntColumn>{id};

  IntColumn get id => integer()();
  TextColumn get owner => text()();
  TextColumn get name => text()();
  TextColumn get url => text()();
  IntColumn get stargazers => integer()();
  IntColumn get watchers => integer()();

}