import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Pedido #$orderId'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Productos:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('- Producto 1'),
            Text('- Producto 2'),
            SizedBox(height: 16),
            Text(
              'Dirección:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Calle Falsa 123'),
            SizedBox(height: 16),
            Text(
              'Estado:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Pendiente'),
          ],
        ),
      ),
    );
  }
}
