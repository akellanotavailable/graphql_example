import 'package:graphql_example/main.dart';
import 'package:graphql_example/models/query_model.dart';

class RepositoryModel implements QueryModel {
  RepositoryModel({
    required this.name,
    required this.starCount,
    required this.primaryLanguage,
    required this.pushedAt,
    required this.ownerLogin,
    required this.isStarredByUser,
  });

  final String? name;
  final int? starCount;
  final String? primaryLanguage;
  final DateTime? pushedAt;
  final String? ownerLogin;
  final bool? isStarredByUser;

  factory RepositoryModel.fromJson(Json json) => RepositoryModel(
        name: json['name'],
        starCount: json['stargazerCount'],
        primaryLanguage: json['primaryLanguage']['name'],
        pushedAt: DateTime.tryParse(json['pushedAt'] ?? ''),
        ownerLogin: json['owner']['login'],
        isStarredByUser: json['viewerHasStarred'],
      );

  Json toJson() => {
    "name": name,
    "stargazerCount": starCount,
    "primaryLanguage": {"name": primaryLanguage},
    "pushedAt": pushedAt,
    "owner": {"login": ownerLogin},
    "viewerHasStarred": isStarredByUser,
  };

  @override
  String get attributes => r"""
    name
    stargazerCount
    primaryLanguage {
      name
    }
    pushedAt
    owner {
      login
    }
    viewerHasStarred
  """;
}
