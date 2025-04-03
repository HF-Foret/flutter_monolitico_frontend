import 'package:flutter/material.dart';

class AdminUsers extends StatelessWidget {
  const AdminUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Usuarios'),
      ),
      body: ListView.builder(
        itemCount: 5, // Número de usuarios (debería venir de la API)
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/2.png'),
            ),
            title: Text('Usuario $index'),
            subtitle: const Text('Correo: juan@ulv.com'),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Editar'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Eliminar'),
                ),
              ],
              onSelected: (value) {
                if (value == 'edit') {
                  // Lógica para editar usuario
                } else if (value == 'delete') {
                  // Lógica para eliminar usuario
                }
              },
            ),
          );
        },
      ),
    );
  }
}
