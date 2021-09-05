import 'dart:convert';

import 'package:shamo_app/models/userModel.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // String? baseUrl = 'http://10.0.2.2:8000/api';
  // String? baseUrl = 'http://127.0.0.1:8000/api';
  String? baseUrl = 'http://192.168.1.9:8000/api';

  Future<UserModel> register({
    required String? name,
    required String? email,
    required String? username,
    required String? password,
  }) async {
    var url = '$baseUrl/register';

    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer' + data['access_token'];

      return user;
    } else {
      throw Exception('Registrasi gagal');
    }
  }

  Future<UserModel> login({
    required String? email,
    required String? password,
  }) async {
    var url = '$baseUrl/login';

    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer' + data['access_token'];

      return user;
    } else {
      throw Exception('Login gagal');
    }
  }
}
