import 'dart:convert';

import 'package:graphql_example/models/user_model/user_model.dart';
import 'package:graphql_example/repositories/base_repository.dart';

final class UserRepository extends BaseRepository<UserModel> {
  @override
  String get repositoryKey => 'user';

}
