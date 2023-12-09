import 'package:shared_preferences/shared_preferences.dart';

class HelperMethod {
  static String? authToken;
  static String? userName;

  static setUserId(String id) async {
    final Loginpref = await SharedPreferences.getInstance();
    Loginpref.setString('userID', id);
  }

  static Future<String?> getUserId() async {
    final Loginpref = await SharedPreferences.getInstance();
    String? loginData = Loginpref.getString('userID');
    return loginData;
  }

  static setUserName(String name) async {
    final Namepref = await SharedPreferences.getInstance();
    Namepref.setString('userName', name);
  }

  static Future<void> getUserName() async {
    final Namepref = await SharedPreferences.getInstance();
    userName = Namepref.getString('userName');
  }

  static void setAuthToken(String token) {
    authToken = token;
  }

  static String? getAuthToken() {
    return authToken;
  }
}
