import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/helper_method.dart';

class DataRequestDetailsService {
  static Future<dynamic> dataRequestDetails(id) async {
    dynamic data;
    try {
      const url =
          'http://103.141.9.234/himsmobappapi/api/v1/requested/user/details?api_key=121212';
      Uri uri = Uri.parse(url);
      final response = await http.post(uri,
          body: {'req_mas_id': id},
          headers: {'Authorization': 'Bearer ${HelperMethod.getAuthToken()}'});

      if (response.statusCode == 200) {
        print('OKif');
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        print('elseif');
        return data;
      }
    } catch (e) {
      print('catchif');
      return data;
    }
  }
}