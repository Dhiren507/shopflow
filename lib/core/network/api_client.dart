import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ApiClient {
  ApiClient._internal();

  static final ApiClient getExistingInstance = ApiClient._internal();

  Future<dynamic> getRequest(String endpoint) async {
    try {
      Response response = await get(Uri.parse(endpoint));

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error while getting the data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> postRequest(
      String endpoint,
      Map<String, dynamic> data,
      ) async {
    final payload = jsonEncode(data);

    try {
      Response response = await post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: payload,
      );
      print(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error while posting the data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
