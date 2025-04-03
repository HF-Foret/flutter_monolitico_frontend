import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<String?> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String baseUrl = 'http://10.50.7.167:3000/api/auth';

  @override
  Future<String?> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token']; // Devuelve el token JWT
    } else {
      print('Error: ${response.body}');
    }
    return null;
  }
}
