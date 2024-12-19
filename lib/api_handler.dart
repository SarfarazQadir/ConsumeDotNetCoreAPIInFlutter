import 'dart:convert';

import 'package:consumedotnetapiinflutter/model.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String baseUri = "https://localhost:7071/api/User";

  Future<List<User>> getUserData() async{
    List<User> data = [];

    final uri = Uri.parse(baseUri);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type' : 'application/json; charset=UTF-8'
        },
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        data = jsonData.map((json) => User.fromJson(json)).toList();
    }
    } catch (e) {
      return data;
    }
    return data;
  }
}