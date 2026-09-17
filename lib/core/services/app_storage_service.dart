import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopflow/core/constants/app_keys.dart';

class AppStorageService {
  AppStorageService._internal();

  static SharedPreferences? _appPref;

  static const _secureAppStorage = FlutterSecureStorage();

  static Future<void> init() async {
    _appPref = await SharedPreferences.getInstance();
  }

  static Future<void> setIsIntroCompleted(bool value) async {
    await _appPref?.setBool(AppKeys.introCompletedKey, value);
  }

  static Future<void> setIsLoggedIn(bool value) async {
    await _appPref?.setBool(AppKeys.isLoggedInKey, value);
  }

  static bool isIntroCompleted = _appPref?.getBool(AppKeys.introCompletedKey) ?? false;

  static Future<void> setAccessToken(String token) async {
    await _secureAppStorage.write(key:AppKeys.accessTokenKey, value: token);
  }

  static Future<String?> getAccessToken(String token) async {
    return await _secureAppStorage.read(key: AppKeys.accessTokenKey);
  }

  static bool isLoggedIn = _appPref?.getBool(AppKeys.isLoggedInKey) ?? false;

  static Future<void> removeAuthTokens() async {
    _appPref?.remove(AppKeys.isLoggedInKey);
    _secureAppStorage.delete(key: AppKeys.accessTokenKey);
  }
}
