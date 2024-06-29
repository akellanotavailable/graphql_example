import 'package:graphql_example/services/isar_service.dart';
import 'package:isar/isar.dart' as isr;

abstract class BaseRepository<T> {
  final _isarService = IsarService();
  late final isar = _isarService.database;
  late final collection = isar.collection<T>();

  Future<void> add(T model) async =>
      isar.writeTxn(() => collection.put(model));

  Future<void> addAll(List<T> models) async =>
      isar.writeTxn(() => collection.putAll(models));

  Future<void> delete(isr.Id id) async =>
      isar.writeTxn(() => collection.delete(id));

  Future<void> deleteAll(List<isr.Id> ids) async =>
      isar.writeTxn(() => collection.deleteAll(ids));

  Future<T?> get(isr.Id id) async => collection.get(id);
}
