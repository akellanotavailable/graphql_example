import 'package:graphql_example/models/user_model.dart';
import 'package:graphql_example/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserService {
  final GraphQLClient _client = GraphqlService().client.value;

  Future<UserModel> getUser() async {
    String query = '''
      query {
        viewer {
          ${UserModel.attributes}
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return UserModel.fromJson(result.data!['viewer']);
  }
}
