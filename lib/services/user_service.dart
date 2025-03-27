import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl =
      'http://10.50.7.167:3000/api/users'; // Cambia localhost por la IP de tu máquina

  Future<bool> registerUser({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String phone,
  }) async {
    final url = Uri.parse('$baseUrl/create'); // Construye la URL completa
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'name': name,
          'lastName': lastName,
          'phone': phone,
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String(),
        }),
      );

      if (response.statusCode == 201) {
        print('Usuario registrado exitosamente');
        return true;
      } else {
        print('Error al registrar usuario: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error de conexión: $e');
      return false;
    }
  }
}
