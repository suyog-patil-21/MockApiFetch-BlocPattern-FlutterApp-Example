import 'dart:io';

import 'package:companieslist/globals/custom_error.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  static const String baseURL = 'https://demo1779595.mockable.io';
  static Future<dynamic> postCompaniesList() async {
    final uri = Uri.parse(baseURL + '/companies');
    try {
      final response = await http.post(uri);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print("status Code : " + response.statusCode.toString());
        print(response.body);
      }
    } catch (err) {
      print(err.toString());
    }
  }
}
