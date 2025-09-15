import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static const String _tokenKey = "token";
  static const String _usernameKey = "username";
  static const String _passwordKey = "password";
  static const String _countingFreeLevel = "countFreeLevel";

  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static Future<void> saveUsername(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }

  static Future<String?> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  static Future<void> deleteUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
  }

  static Future<void> savePassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_passwordKey, password);
  }

  static Future<String?> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_passwordKey);
  }

  static Future<void> deletePassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_passwordKey);
  }

  static Future<void> deleteLocalStorage(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> saveCountingFreeLevel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_countingFreeLevel, "0");
  }

  static Future<String?> getCountingFreeLevel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_countingFreeLevel);
  }

  static Future<void> incrementCountingFreeLevel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentValue = prefs.getString(_countingFreeLevel);

    int currentCount = int.tryParse(currentValue ?? "0") ?? 0;

    currentCount += 1;
    await prefs.setString(_countingFreeLevel, currentCount.toString());
  }
}
