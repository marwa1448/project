import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  static Future<void> saveUserName(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  static Future<void> saveUserPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password);
  }

  static Future<String?> getUserPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  static Future<void> saveUserStayLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<bool?> getUserStayLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn');
  }

  static Future<void> saveDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  static Future<bool?> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode');
  }

  static Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> removeKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
