import 'package:graphql_example/main.dart';
import 'package:graphql_example/models/credentials.dart';
import 'package:graphql_example/models/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  factory IsarService() {
    return _instance;
  }

  IsarService._();

  static final IsarService _instance = IsarService._();

  final dbName = 'localStorage';
  late final Isar _database;

  bool _isInitialized = false;

  Isar get database {
    assert(_isInitialized, 'Database has not been initiated yet.');
    return _database;
  }

  Future<void> initDB() async {
    logger.d('Initiating Isar');
    final dir = await getApplicationDocumentsDirectory();
    _database = await Isar.open(
      [
        UserSchema,
        CredentialsSchema,
      ],
      directory: dir.path,
    );
    _isInitialized = true;
  }
}
