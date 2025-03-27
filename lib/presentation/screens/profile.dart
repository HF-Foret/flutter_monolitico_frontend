import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/3.png'),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logica para guardar cambios
              },
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
