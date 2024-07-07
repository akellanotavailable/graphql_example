import 'package:graphql_example/models/repository_model.dart';
import 'package:graphql_example/models/response_with_pagination.dart';
import 'package:graphql_example/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserReposService {
  final GraphQLClient _client = GraphqlService().client.value;

  Future<ResponseWithPagination<RepositoryModel>> getRepositories({
    String? cursor,
    int repositories = 10,
  }) async {
    String query = '''
      query(\$cursor: String, \$repositories: Int) {
        viewer {
          repositories(first: \$repositories, after: \$cursor) {
            nodes {
              ${RepositoryModel.attributes}
            }
            pageInfo {
              endCursor
              hasNextPage
            }
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {
        'cursor': cursor,
        'repositories': repositories,
      },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final repositoriesData = result.data!['viewer']['repositories'];
    final List<RepositoryModel> repositoriesList =
        (repositoriesData['nodes'] as List)
            .map((node) => RepositoryModel.fromJson(node))
            .toList();

    return ResponseWithPagination<RepositoryModel>(
      results: repositoriesList,
      cursor: repositoriesData['pageInfo']['endCursor'],
      hasNextPage: repositoriesData['pageInfo']['hasNextPage'],
    );
  }
}
