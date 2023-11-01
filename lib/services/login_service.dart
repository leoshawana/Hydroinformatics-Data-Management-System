import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  static Future<dynamic> userLogin(email, password) async {

    dynamic data;
    try {
      final url = 'http://192.168.91.160:8082/api/v1/user/login';
      Uri uri = Uri.parse(url);
      final response = await http.post(uri, body: {
        'username': email,
        'password': password,
        'api_key': '121212'
      });

      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return data;
      } else{
        print(response.statusCode);
        data = jsonDecode(response.body.toString());
        return data;
      }
    } catch (e) {
      return data;
    }
  }
}
