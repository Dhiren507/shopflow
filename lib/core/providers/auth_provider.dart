import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shopflow/core/constants/api_endpoints.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    Map<String, String> loginData = {"email": email, "password": password};

    try {
      Response response = await post(
        Uri.parse(ApiEndpoints.loginEndpoint),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(loginData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading = false;
        print('log in success');
        return true;
      } else {
        print('login failed');
        return false;
      }
    } catch (e) {
      throw Exception('Error while log in');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
