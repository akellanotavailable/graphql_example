import 'package:flutter/material.dart';
import 'package:graphql_example/models/user_model.dart';
import 'package:graphql_example/services/graphql/user_service.dart';

class UserController with ChangeNotifier {
  final _userService = UserService();

  UserModel? user;
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchUser() async {
    isLoading = true;
    notifyListeners();

    try {
      user = await _userService.getUser();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
