import 'package:graphql_example/database/models/credentials_db.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

/// Make sure to initialize the instance before using it
class LocalStorage {
  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._();

  static final LocalStorage _instance = LocalStorage._();

  late final Isar _database;

  bool _isInitialized = false;

  /// Should be called in main method
  /// await LocalStorage().init()
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [CredentialsDbSchema],
      directory: dir.path,
    );
    _database = isar;
    _isInitialized = true;
  }

  Isar get database {
    assert(_isInitialized, 'Database has not been initiated yet.');
    return _database;
  }
}
