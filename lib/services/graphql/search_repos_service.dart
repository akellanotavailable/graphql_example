import 'package:graphql_example/models/repository_model.dart';
import 'package:graphql_example/models/response_with_pagination.dart';
import 'package:graphql_example/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SearchReposService {
  final GraphQLClient _client = GraphqlService().client.value;

  Future<ResponseWithPagination<RepositoryModel>> searchRepositories({
    required String query,
    int first = 10,
    String? after,
  }) async {
    String searchQuery = '''
      query SearchRepos(\$query: String!, \$first: Int!, \$after: String) {
        search(query: \$query, type: REPOSITORY, first: \$first, after: \$after) {
          repositoryCount
          pageInfo {
            endCursor
            hasNextPage
          }
          edges {
            cursor
            node {
              ... on Repository {
                ${RepositoryModel.attributes}
              }
            }
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(searchQuery),
      variables: {
        'query': query,
        'first': first,
        'after': after,
      },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List repositoriesData = result.data!['search']['edges'];
    final List<RepositoryModel> repositoriesList = repositoriesData
        .map((edge) => RepositoryModel.fromJson(edge['node']))
        .toList();

    final pageInfo = result.data!['search']['pageInfo'];

    return ResponseWithPagination(
      results: repositoriesList,
      cursor: pageInfo['endCursor'] ?? '',
      hasNextPage: pageInfo['hasNextPage'],
    );
  }
}
