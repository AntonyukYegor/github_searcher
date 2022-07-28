// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class GitHubRepoTableData extends DataClass
    implements Insertable<GitHubRepoTableData> {
  final int id;
  final String owner;
  final String name;
  final String url;
  final int stargazers;
  final int watchers;
  GitHubRepoTableData(
      {required this.id,
      required this.owner,
      required this.name,
      required this.url,
      required this.stargazers,
      required this.watchers});
  factory GitHubRepoTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GitHubRepoTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      owner: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}owner'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      stargazers: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stargazers'])!,
      watchers: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}watchers'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['owner'] = Variable<String>(owner);
    map['name'] = Variable<String>(name);
    map['url'] = Variable<String>(url);
    map['stargazers'] = Variable<int>(stargazers);
    map['watchers'] = Variable<int>(watchers);
    return map;
  }

  GitHubRepoTableCompanion toCompanion(bool nullToAbsent) {
    return GitHubRepoTableCompanion(
      id: Value(id),
      owner: Value(owner),
      name: Value(name),
      url: Value(url),
      stargazers: Value(stargazers),
      watchers: Value(watchers),
    );
  }

  factory GitHubRepoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GitHubRepoTableData(
      id: serializer.fromJson<int>(json['id']),
      owner: serializer.fromJson<String>(json['owner']),
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String>(json['url']),
      stargazers: serializer.fromJson<int>(json['stargazers']),
      watchers: serializer.fromJson<int>(json['watchers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'owner': serializer.toJson<String>(owner),
      'name': serializer.toJson<String>(name),
      'url': serializer.toJson<String>(url),
      'stargazers': serializer.toJson<int>(stargazers),
      'watchers': serializer.toJson<int>(watchers),
    };
  }

  GitHubRepoTableData copyWith(
          {int? id,
          String? owner,
          String? name,
          String? url,
          int? stargazers,
          int? watchers}) =>
      GitHubRepoTableData(
        id: id ?? this.id,
        owner: owner ?? this.owner,
        name: name ?? this.name,
        url: url ?? this.url,
        stargazers: stargazers ?? this.stargazers,
        watchers: watchers ?? this.watchers,
      );
  @override
  String toString() {
    return (StringBuffer('GitHubRepoTableData(')
          ..write('id: $id, ')
          ..write('owner: $owner, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('stargazers: $stargazers, ')
          ..write('watchers: $watchers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, owner, name, url, stargazers, watchers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GitHubRepoTableData &&
          other.id == this.id &&
          other.owner == this.owner &&
          other.name == this.name &&
          other.url == this.url &&
          other.stargazers == this.stargazers &&
          other.watchers == this.watchers);
}

class GitHubRepoTableCompanion extends UpdateCompanion<GitHubRepoTableData> {
  final Value<int> id;
  final Value<String> owner;
  final Value<String> name;
  final Value<String> url;
  final Value<int> stargazers;
  final Value<int> watchers;
  const GitHubRepoTableCompanion({
    this.id = const Value.absent(),
    this.owner = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.stargazers = const Value.absent(),
    this.watchers = const Value.absent(),
  });
  GitHubRepoTableCompanion.insert({
    this.id = const Value.absent(),
    required String owner,
    required String name,
    required String url,
    required int stargazers,
    required int watchers,
  })  : owner = Value(owner),
        name = Value(name),
        url = Value(url),
        stargazers = Value(stargazers),
        watchers = Value(watchers);
  static Insertable<GitHubRepoTableData> custom({
    Expression<int>? id,
    Expression<String>? owner,
    Expression<String>? name,
    Expression<String>? url,
    Expression<int>? stargazers,
    Expression<int>? watchers,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (owner != null) 'owner': owner,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (stargazers != null) 'stargazers': stargazers,
      if (watchers != null) 'watchers': watchers,
    });
  }

  GitHubRepoTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? owner,
      Value<String>? name,
      Value<String>? url,
      Value<int>? stargazers,
      Value<int>? watchers}) {
    return GitHubRepoTableCompanion(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      name: name ?? this.name,
      url: url ?? this.url,
      stargazers: stargazers ?? this.stargazers,
      watchers: watchers ?? this.watchers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (owner.present) {
      map['owner'] = Variable<String>(owner.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (stargazers.present) {
      map['stargazers'] = Variable<int>(stargazers.value);
    }
    if (watchers.present) {
      map['watchers'] = Variable<int>(watchers.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GitHubRepoTableCompanion(')
          ..write('id: $id, ')
          ..write('owner: $owner, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('stargazers: $stargazers, ')
          ..write('watchers: $watchers')
          ..write(')'))
        .toString();
  }
}

class $GitHubRepoTableTable extends GitHubRepoTable
    with TableInfo<$GitHubRepoTableTable, GitHubRepoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GitHubRepoTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _ownerMeta = const VerificationMeta('owner');
  @override
  late final GeneratedColumn<String?> owner = GeneratedColumn<String?>(
      'owner', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stargazersMeta = const VerificationMeta('stargazers');
  @override
  late final GeneratedColumn<int?> stargazers = GeneratedColumn<int?>(
      'stargazers', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _watchersMeta = const VerificationMeta('watchers');
  @override
  late final GeneratedColumn<int?> watchers = GeneratedColumn<int?>(
      'watchers', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, owner, name, url, stargazers, watchers];
  @override
  String get aliasedName => _alias ?? 'git_hub_repo_table';
  @override
  String get actualTableName => 'git_hub_repo_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<GitHubRepoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('owner')) {
      context.handle(
          _ownerMeta, owner.isAcceptableOrUnknown(data['owner']!, _ownerMeta));
    } else if (isInserting) {
      context.missing(_ownerMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('stargazers')) {
      context.handle(
          _stargazersMeta,
          stargazers.isAcceptableOrUnknown(
              data['stargazers']!, _stargazersMeta));
    } else if (isInserting) {
      context.missing(_stargazersMeta);
    }
    if (data.containsKey('watchers')) {
      context.handle(_watchersMeta,
          watchers.isAcceptableOrUnknown(data['watchers']!, _watchersMeta));
    } else if (isInserting) {
      context.missing(_watchersMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GitHubRepoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GitHubRepoTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GitHubRepoTableTable createAlias(String alias) {
    return $GitHubRepoTableTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GitHubRepoTableTable gitHubRepoTable =
      $GitHubRepoTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gitHubRepoTable];
}
