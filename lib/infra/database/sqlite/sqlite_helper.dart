import 'package:atv_flutter_03/infra/database/sqlite/migration.dart'
    as migration;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  static final SqliteHelper _instance = SqliteHelper._();
  static Database? _database;

  SqliteHelper._();

  factory SqliteHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database as Database;

    _database = await _connect();

    return _database as Database;
  }

  Future<Database> _connect() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final databasePath = join(documentsDirectory.path, 'database.db');

    return openDatabase(databasePath, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database database, int version) async {
    await database.execute(migration.onCreate());
  }
}
