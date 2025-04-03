import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menú Principal',
          style: TextStyle(color: Colors.white), // Título blanco
        ),
        backgroundColor: Colors.blue[900], // Fondo azul oscuro
        iconTheme: const IconThemeData(color: Colors.white), // Íconos blancos
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[900]!,
              Colors.blue[800]!,
              Colors.blue[400]!,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading:
                  const Icon(Icons.people, color: Colors.white), // Ícono blanco
              title: const Text(
                'Lista de Usuarios',
                style: TextStyle(color: Colors.white), // Texto blanco
              ),
              tileColor: Colors.blue[800], // Color de fondo por defecto
              selectedTileColor: Colors.blue[600], // Color al seleccionar
              hoverColor: const Color(0xFFA1E3F9), // Color al pasar el cursor
              onTap: () {
                Navigator.pushNamed(context, '/user_list');
              },
            ),
            const Divider(color: Colors.white), // Divider blanco
            ListTile(
              leading: const Icon(Icons.shopping_cart,
                  color: Colors.white), // Ícono blanco
              title: const Text(
                'Lista de Productos',
                style: TextStyle(color: Colors.white), // Texto blanco
              ),
              tileColor: Colors.blue[800],
              selectedTileColor: Colors.blue[600],
              hoverColor: const Color(0xFFA1E3F9), // Color al pasar el cursor
              onTap: () {
                Navigator.pushNamed(context, '/product/list');
              },
            ),
            const Divider(color: Colors.white), // Divider blanco
            ListTile(
              leading: const Icon(Icons.list_alt,
                  color: Colors.white), // Ícono blanco
              title: const Text(
                'Lista de Órdenes',
                style: TextStyle(color: Colors.white), // Texto blanco
              ),
              tileColor: Colors.blue[800],
              selectedTileColor: Colors.blue[600],
              hoverColor: const Color(0xFFA1E3F9), // Color al pasar el cursor
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
            ),
            const Divider(color: Colors.white), // Divider blanco
            ListTile(
              leading:
                  const Icon(Icons.info, color: Colors.white), // Ícono blanco
              title: const Text(
                'Detalles de una Orden',
                style: TextStyle(color: Colors.white), // Texto blanco
              ),
              tileColor: Colors.blue[800],
              selectedTileColor: Colors.blue[600],
              hoverColor: const Color(0xFFA1E3F9), // Color al pasar el cursor
              onTap: () {
                Navigator.pushNamed(context, '/order/detail');
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.white),
              title: const Text(
                'Historial de Pedidos',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/orders/history');
              },
            ),
          ],
        ),
      ),
    );
  }
}
