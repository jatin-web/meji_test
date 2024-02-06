import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String email = 'email';
  static const String login = 'login';

  Future<String> getString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? "";
  }

  Future<void> setString(String key, String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, val);
  }

  Future<void> clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future<void> setBool(String key, bool val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key, val);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key) ?? false;
  }
}
