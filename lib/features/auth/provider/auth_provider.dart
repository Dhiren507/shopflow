import 'package:flutter/foundation.dart';
import 'package:shopflow/core/constants/api_endpoints.dart';
import 'package:shopflow/core/constants/app_keys.dart';
import 'package:shopflow/core/network/api_client.dart';
import 'package:shopflow/core/services/app_storage_service.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    Map<String, String> loginData = {"email": email, "password": password};

    try {
      final loginResponse = await ApiClient.getExistingInstance.postRequest(
        ApiEndpoints.loginEndpoint,
        loginData,
      );

      if (loginResponse != null) {
        isLoading = false;
        await AppStorageService.setAccessToken(
          loginResponse[AppKeys.accessTokenKey],
        );
        await AppStorageService.setIsLoggedIn(true);
        print('log in success $loginResponse');
        return true;
      } else {
        hasError = true;
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

  Future<void> logout() async {
    await AppStorageService.removeAuthTokens();
    notifyListeners();
  }
}
