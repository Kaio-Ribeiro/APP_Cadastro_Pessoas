// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseApp {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseAppBuilder databaseBuilder(String name) =>
      _$DatabaseAppBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseAppBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseAppBuilder(null);
}

class _$DatabaseAppBuilder {
  _$DatabaseAppBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseAppBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseAppBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseApp> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseApp();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseApp extends DatabaseApp {
  _$DatabaseApp([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PersonRepositoryDAO? _personRepositoryDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Person` (`name` INTEGER NOT NULL, `contact` INTEGER NOT NULL, `address` TEXT NOT NULL, `code` INTEGER PRIMARY KEY AUTOINCREMENT, `createdIn` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PersonRepositoryDAO get personRepositoryDAO {
    return _personRepositoryDAOInstance ??=
        _$PersonRepositoryDAO(database, changeListener);
  }
}

class _$PersonRepositoryDAO extends PersonRepositoryDAO {
  _$PersonRepositoryDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'Person',
            (Person item) => <String, Object?>{
                  'name': item.name,
                  'contact': item.contact,
                  'address': item.address,
                  'code': item.code,
                  'createdIn': item.createdIn
                }),
        _personUpdateAdapter = UpdateAdapter(
            database,
            'Person',
            ['code'],
            (Person item) => <String, Object?>{
                  'name': item.name,
                  'contact': item.contact,
                  'address': item.address,
                  'code': item.code,
                  'createdIn': item.createdIn
                }),
        _personDeletionAdapter = DeletionAdapter(
            database,
            'Person',
            ['code'],
            (Person item) => <String, Object?>{
                  'name': item.name,
                  'contact': item.contact,
                  'address': item.address,
                  'code': item.code,
                  'createdIn': item.createdIn
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Person> _personInsertionAdapter;

  final UpdateAdapter<Person> _personUpdateAdapter;

  final DeletionAdapter<Person> _personDeletionAdapter;

  @override
  Future<List<Person>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, Object?> row) => Person(
            code: row['code'] as int?,
            createdIn: row['createdIn'] as String,
            name: row['name'] as String,
            contact: row['contact'] as String,
            address: row['address'] as String));
  }

  @override
  Future<int> insertItem(Person item) {
    return _personInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(Person item) {
    return _personUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Person item) {
    return _personDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
