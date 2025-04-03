import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Pedidos'),
      ),
      body: ListView.builder(
        itemCount: 10, // Cambia esto por la cantidad real de pedidos históricos
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Pedido Histórico #$index'),
            subtitle: const Text('Estado: Entregado'),
          );
        },
      ),
    );
  }
}
