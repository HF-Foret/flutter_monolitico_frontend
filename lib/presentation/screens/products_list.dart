import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definir los datos
    final productList = [
      {
        'code': 'L001',
        'product': 'Laptop HP',
        'description': 'Core i7 512GB SSD 12GB RAM',
        'stock': '12',
        'cost': '\$12,799.00'
      },
      {
        'code': 'I001',
        'product': 'Impresora Zebra',
        'description': 'Impresora multifuncional Láser Jet multicolor',
        'stock': '5',
        'cost': '\$8,990.00'
      },
      {
        'code': 'M001',
        'product': 'Mouse Logitech',
        'description': 'Mouse gamer RGB inalámbrico 3200 DPI',
        'stock': '50',
        'cost': '\$489.00'
      },
      {
        'code': 'T001',
        'product': 'Teclado Mecánico',
        'description': 'Teclado RGB con switches mecánicos rojos',
        'stock': '30',
        'cost': '\$1,299.00'
      },
      {
        'code': 'M002',
        'product': 'Monitor Samsung',
        'description': 'Monitor LED 27" Full HD 75Hz',
        'stock': '15',
        'cost': '\$4,500.00'
      },
      {
        'code': 'D001',
        'product': 'Disco Duro Externo',
        'description': 'HDD 2TB USB 3.0 WD Elements',
        'stock': '20',
        'cost': '\$1,799.00'
      },
      {
        'code': 'S001',
        'product': 'Silla Gamer',
        'description': 'Silla ergonómica reclinable con soporte lumbar',
        'stock': '10',
        'cost': '\$5,599.00'
      },
      {
        'code': 'A001',
        'product': 'Audífonos HyperX',
        'description': 'Audífonos gamer con micrófono y sonido envolvente',
        'stock': '25',
        'cost': '\$2,199.00'
      },
      {
        'code': 'M003',
        'product': 'Memoria RAM Corsair',
        'description': '16GB DDR4 3200MHz',
        'stock': '35',
        'cost': '\$1,200.00'
      },
      {
        'code': 'P001',
        'product': 'Procesador Ryzen 7',
        'description': 'AMD Ryzen 7 5800X 8 núcleos 4.7GHz',
        'stock': '8',
        'cost': '\$7,999.00'
      },
      {
        'code': 'T002',
        'product': 'Tarjeta Madre ASUS',
        'description': 'Compatible con Ryzen, 4 slots RAM, M.2 NVMe',
        'stock': '12',
        'cost': '\$3,299.00'
      },
      {
        'code': 'G001',
        'product': 'Tarjeta Gráfica RTX',
        'description': 'Nvidia RTX 3060 12GB GDDR6',
        'stock': '6',
        'cost': '\$10,499.00'
      },
      {
        'code': 'E001',
        'product': 'Estabilizador UPS',
        'description': 'UPS 1200VA para PC y servidores',
        'stock': '10',
        'cost': '\$2,799.00'
      },
      {
        'code': 'W001',
        'product': 'Webcam Logitech',
        'description': 'Webcam Full HD 1080p con micrófono',
        'stock': '18',
        'cost': '\$1,099.00'
      },
      {
        'code': 'H001',
        'product': 'Hub USB 3.0',
        'description': 'Hub de 4 puertos USB 3.0 de alta velocidad',
        'stock': '40',
        'cost': '\$350.00'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Código: ${product['code']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Producto: ${product['product']}'),
                  const SizedBox(height: 8),
                  Text('Descripción: ${product['description']}'),
                  const SizedBox(height: 8),
                  Text('Stock: ${product['stock']}'),
                  const SizedBox(height: 8),
                  Text('Costo: ${product['cost']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
