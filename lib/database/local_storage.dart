import 'package:graphql_example/models/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._() {
    getApplicationDocumentsDirectory().then((directory) {
      Isar.open(
        [UserSchema],
        directory: directory.path,
      ).then((isar) {
        _database = isar;
        _isInitialized = true;
      });
    });
  }

  static final LocalStorage _instance = LocalStorage._();

  final dbName = 'localStorage';
  late final Isar _database;

  bool _isInitialized = false;

  Isar get database {
    assert(_isInitialized, 'Database has not been initiated yet.');
    return _database;
  }
}
