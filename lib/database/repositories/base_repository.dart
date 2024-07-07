import 'package:graphql_example/database/local_storage.dart';

abstract class BaseRepository<T> {
  final _localStorage = LocalStorage();
  late final repoSchema = _localStorage.database.collection<T>();

  Future<int> add(T model) async =>
      repoSchema.isar.writeTxn(() => repoSchema.put(model));

  Future<List<int>> addAll(List<T> models) async =>
      repoSchema.isar.writeTxn(() => repoSchema.putAll(models));

  Future<T?> get(int id) async => repoSchema.get(id);

  Future<List<T?>> getAll(List<int> ids) async => repoSchema.getAll(ids);

  Future<void> delete(int id) async =>
      repoSchema.isar.writeTxn(() => repoSchema.delete(id));

  Future<void> deleteAll(List<int> ids) async =>
      repoSchema.isar.writeTxn(() => repoSchema.deleteAll(ids));

  Future<void> clear() async => repoSchema.clear();
}
