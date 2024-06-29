import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  User({required this.username});

  /// User can only be stored in a single instance.
  Id get id => 0;
  final String username;
}
