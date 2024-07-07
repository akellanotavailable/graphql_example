import 'package:graphql_example/services/graphql_service.dart';

class SearchReposService {
  final _client = GraphqlService().client.value;
}