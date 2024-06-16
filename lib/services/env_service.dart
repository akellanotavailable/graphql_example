import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  final String clientId = dotenv.env['CLIENT_ID']!;
  final String clientSecret = dotenv.env['CLIENT_SECRET']!;
  final String redirectUri = dotenv.env['REDIRECT_URI']!;
  final String authorizationEndpoint = dotenv.env['AUTHORIZATION_ENDPOINT']!;
  final String tokenEndpoint = dotenv.env['TOKEN_ENDPOINT']!;
}