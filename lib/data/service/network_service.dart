import 'dart:io';

import 'package:http/http.dart' as http;

import '../../globals/custom_error.dart';

class NetworkService {
  static const String baseURL = 'https://demo1779595.mockable.io';
  static Future<String> postCompaniesList() async {
    final uri = Uri.parse(baseURL + '/companies');
    try {
      final response = await http.post(uri);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw CustomError('Cannot Find Data');
      }
    } on SocketException {
      throw CustomError('No Internet Connection');
    }
  }
}
