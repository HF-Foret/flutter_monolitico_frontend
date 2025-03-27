import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de usuarios
    final userList = [
      {
        'id': '1',
        'email': 'foret@example.com',
        'password': '123qwe1',
        'name': 'Foret',
        'lastName': 'Gómez',
        'phone': '1234567891',
        'image': null,
        'is_available': '1',
        'session_token': null,
        'created_at': '2025-03-06 12:19:09.697',
        'updated_at': '2025-03-06 12:19:09.697',
      },
      {
        'id': '2',
        'email': 'gerardo@example.com',
        'password': '123qwe2',
        'name': 'Gerardo',
        'lastName': 'López',
        'phone': '1234567892',
        'image': null,
        'is_available': '1',
        'session_token': null,
        'created_at': '2025-03-06 12:19:09.697',
        'updated_at': '2025-03-06 12:19:09.697',
      },
      // Agrega más usuarios aquí...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${user['id']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Email: ${user['email']}'),
                  const SizedBox(height: 8),
                  Text('Nombre: ${user['name']} ${user['lastName']}'),
                  const SizedBox(height: 8),
                  Text('Teléfono: ${user['phone']}'),
                  const SizedBox(height: 8),
                  Text(
                      'Disponible: ${user['is_available'] == '1' ? 'Sí' : 'No'}'),
                  const SizedBox(height: 8),
                  Text('Creado: ${user['created_at']}'),
                  const SizedBox(height: 8),
                  Text('Actualizado: ${user['updated_at']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
