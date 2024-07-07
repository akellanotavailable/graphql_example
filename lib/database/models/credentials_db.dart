// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'credentials_db.g.dart';

@Collection()
class CredentialsDb {
  CredentialsDb({required this.accessToken});

  /// Credentials can be stored only in single instance.
  Id get id => 0;

  final String accessToken;
}
