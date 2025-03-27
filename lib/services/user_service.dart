import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl =
      'http://10.50.7.167:3000/api/users'; // Cambia la URL según tu backend

  Future<bool> registerUser({
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(baseUrl); // Endpoint para registrar usuarios
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'lastName': lastName,
        'phone': phone,
        'email': email,
        'password': password,
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      }),
    );

    if (response.statusCode == 201) {
      // Usuario creado exitosamente
      return true;
    } else {
      // Manejar errores
      print('Error al registrar usuario: ${response.body}');
      return false;
    }
  }
}
