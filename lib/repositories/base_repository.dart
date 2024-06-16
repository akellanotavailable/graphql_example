import 'dart:convert';

import 'package:graphql_example/main.dart';

abstract class BaseRepository<T> {
  String get repositoryKey;
  final repository = database;

  @override
  Future<void> add(T model) async {
    repository.write(key: repositoryKey, value: model?.toJson().toString());
  }
  
  @override
  Future<void> delete() async {
    repository.delete(key: repositoryKey);
  }
  
  @override
  Future<T?> get() async {
    final userString = await repository.read(key: repositoryKey);
    if (userString == null) {
      return null;
    }
    return T.fromJson(json.decode(userString));
  }
}
