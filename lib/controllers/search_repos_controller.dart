import 'package:flutter/material.dart';
import 'package:graphql_example/models/repository_model.dart';
import 'package:graphql_example/services/graphql/search_repos_service.dart';

class SearchReposController with ChangeNotifier {
  final _searchRepositoryService = SearchReposService();

  List<RepositoryModel> repositories = [];
  bool isLoading = false;
  String? errorMessage;
  String? cursor;
  bool hasNextPage = true;

  Future<void> searchRepositories({
    required String query,
    int repositoriesPerPage = 10,
  }) async {
    if (isLoading || !hasNextPage) return;

    isLoading = true;
    notifyListeners();

    try {
      final result = await _searchRepositoryService.searchRepositories(
        query: query,
        first: repositoriesPerPage,
        after: cursor,
      );

      final newRepositories = result.results;
      repositories.addAll(newRepositories);

      cursor = result.cursor;
      hasNextPage = result.hasNextPage;

      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    repositories.clear();
    cursor = null;
    hasNextPage = true;
    errorMessage = null;
    notifyListeners();
  }
}
