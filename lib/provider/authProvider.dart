import 'package:flutter/material.dart';
import 'package:shamo_app/models/userModel.dart';
import 'package:shamo_app/services/authService.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  // getter user
  UserModel get user => _user;

  // setter user
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? name,
    String? email,
    String? username,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        email: email,
        username: username,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
