import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:dio/dio.dart';
import 'package:graphql_example/database/repositories/credentials_repository.dart';
import 'package:graphql_example/main.dart';
import 'env_service.dart';

class AuthService {
  final _envService = EnvService();
  final _credentialsRepo = CredentialsRepository();
  final _dio = Dio();

  /// Performs authentication with Github App (OAuth).
  /// Returns [String] containing Access Token.
  Future<String> signInWithGitHub() async {
    final url =
        '${_envService.authorizationEndpoint}?client_id=${_envService.clientId}'
        '&redirect_uri=${_envService.redirectUri}&scope=read:user,user:email';

    final result = await FlutterWebAuth.authenticate(
      url: url,
      callbackUrlScheme: 'githubdocs',
    );

    final code = Uri.parse(result).queryParameters['code'];

    final response = await _dio.post(
      _envService.tokenEndpoint,
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
      data: {
        'client_id': _envService.clientId,
        'client_secret': _envService.clientSecret,
        'code': code,
        'redirect_uri': _envService.redirectUri,
      },
    );

    final accessToken = response.data['access_token'];

    logger.d('Access Token: $accessToken');
    return accessToken;
  }

  Future<bool> isUserAuthenticated() async {
    return (await _credentialsRepo.get(0)) != null;
  }
}
