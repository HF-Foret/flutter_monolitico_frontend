import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  final bool isAdmin; // Define si el usuario es administrador

  const OrdersScreen({super.key, this.isAdmin = false});

  @override
  Widget build(BuildContext context) {
    final orders = isAdmin
        ? ['Pedido 1 (Admin)', 'Pedido 2 (Admin)'] // Pedidos para admin
        : ['Pedido 1 (Cliente)', 'Pedido 2 (Cliente)']; // Pedidos para cliente

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pedidos'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(orders[index]),
            onTap: () {
              Navigator.pushNamed(context, '/order/${index + 1}');
            },
          );
        },
      ),
    );
  }
}
