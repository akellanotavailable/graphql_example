// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'credentials.g.dart';

@Collection()
class Credentials {
  Credentials({
    required this.accessToken,
    this.refreshToken,
  });

  /// Credentials can be stored only in single instance.
  Id get id => 0;

  final String accessToken;
  final String? refreshToken;
}
