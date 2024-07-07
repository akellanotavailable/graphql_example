import 'package:flutter/material.dart';
import 'package:graphql_example/models/repository_model.dart';
import 'package:graphql_example/services/graphql/user_repos_service.dart';

class UserReposController with ChangeNotifier {
  final _userRepositoryService = UserReposService();

  List<RepositoryModel> repositories = [];
  bool isLoading = false;
  String? errorMessage;
  String? cursor;
  bool hasNextPage = true;

  Future<void> fetchRepositories({int repositoriesPerPage = 9}) async {
    if (isLoading || !hasNextPage) return;

    isLoading = true;
    notifyListeners();

    try {
      final newRepositories = await _userRepositoryService.getRepositories(
        cursor: cursor,
        repositories: repositoriesPerPage,
      );

      repositories.addAll(newRepositories.results);
      cursor = newRepositories.cursor;
      hasNextPage = newRepositories.hasNextPage;

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
