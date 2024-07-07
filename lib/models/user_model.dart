// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graphql_example/main.dart';
import 'package:graphql_example/models/query_model.dart';

class UserModel implements QueryModel {
  UserModel({
    required this.login,
    required this.name,
    required this.location,
    required this.bio,
    required this.company,
    required this.email,
    required this.avatarUrl,
    required this.followersCount,
    required this.createdAt,
  });

  final String? login;
  final String? name;
  final String? location;
  final String? bio;
  final String? company;
  final String? email;
  final String? avatarUrl;
  final int? followersCount;
  final DateTime? createdAt;

  factory UserModel.fromJson(Json json) {
    return UserModel(
      login: json['login'],
      name: json['name'],
      location: json['location'],
      bio: json['bio'],
      company: json['company'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      followersCount: json['followers']['totalCount'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
    );
  }

  Json toJson() => {
        "login": login,
        "name": name,
        "location": location,
        "bio": bio,
        "company": company,
        "email": email,
        "avatarUrl": avatarUrl,
        "followers": {
          "totalCount": followersCount,
        },
        "createdAt": createdAt.toString(),
      };

  @override
  String get attributes => r"""
    avatarUrl
    bio
    company
    createdAt
    email
    followers {
      totalCount
    }
    name
    login
    location
  """;
}
