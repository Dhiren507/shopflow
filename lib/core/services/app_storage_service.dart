import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._internal();

  static SharedPreferences? _appPref;

  static Future<void> init() async {
    _appPref = await SharedPreferences.getInstance();
  }

  static final String _accessTokenKey = 'access_token';
  static final String _introCompletedKey = "is_intro_completed";
  static final String _isLoggedInKey = 'is_logged_in';

  static Future<void> setAccessToken(String token) async {
    await _appPref?.setString(_accessTokenKey, token);
  }

  static Future<void> setIsIntroCompleted(bool value) async {
    await _appPref?.setBool(_introCompletedKey, value);
  }

  static Future<void> setIsLoggedIn(bool value) async {
    await _appPref?.setBool(_isLoggedInKey, value);
  }

  static String? getAccessToken = _appPref?.getString(_accessTokenKey);

  static bool isIntroCompleted = _appPref?.getBool(_introCompletedKey) ?? false;

  static bool isLoggedIn = _appPref?.getBool(_isLoggedInKey) ?? false;

  static Future<void> removeAuthTokens() async {
      _appPref?.remove(_isLoggedInKey);
      _appPref?.remove(_accessTokenKey);
  }
}
