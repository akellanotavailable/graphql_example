import 'package:flutter/foundation.dart';
import 'package:graphql_example/database/repositories/credentials_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlService {
  factory GraphqlService() {
    return _instance;
  }

  GraphqlService._();

  static final GraphqlService _instance = GraphqlService._();

  final _httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final _credRepo = CredentialsRepository();

  late final _authLink = AuthLink(
    getToken: () async {
      final accessToken = (await _credRepo.get(0))?.accessToken;
      return 'Bearer $accessToken';
    },
  );

  late final _link = _authLink.concat(_httpLink);

  late final client = ValueNotifier(
    GraphQLClient(
      link: _link,
      /// Since we do not manipulate GraphQL cache, there is no need to 
      /// implement special storage.
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
}
