import 'package:graphql_example/repositories/base_repository.dart';

class CredentialsRepository extends BaseRepository {
  @override
  String get repositoryKey => 'credentials';
  
  @override
  Future<void> add(model) {
    // TODO: implement add
    throw UnimplementedError();
  }
  
  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future get() {
    // TODO: implement get
    throw UnimplementedError();
  }

}