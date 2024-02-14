import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<dynamic> getData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return json.decode(response.body);
  }

  Future<dynamic> postData(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return json.decode(response.body);
  }

  Future<dynamic> putData(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return json.decode(response.body);
  }

  Future<dynamic> deleteData(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));
    return json.decode(response.body);
  }
}
