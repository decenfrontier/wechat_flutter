import 'package:shared_preferences/shared_preferences.dart';

const tokenKey = 'token';

// 获取token
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString(tokenKey);
  return token;
}

// 设置token
void setToken(token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(tokenKey, token);
}

// 移除token
Future<bool> rmToken() async {
  final prefs = await SharedPreferences.getInstance();
  final success = await prefs.remove('counter');
  return success;
}
