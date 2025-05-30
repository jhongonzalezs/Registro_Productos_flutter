// lib/widgets/producto_card.dart
import 'package:flutter/material.dart';
import '../entities/producto.dart';
import '../data/productos_data.dart';

class ProductoCard extends StatelessWidget {
  final Producto producto;
  final VoidCallback onDelete;

  const ProductoCard({
    super.key,
    required this.producto,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          producto.nombre,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('Referencia: ${producto.referencia}'),
            Text('Precio: \$${producto.precio}'),
            Text('Descripción: ${producto.descripcion}'),
            Text('Agregado: ${producto.fechaAgregado.toLocal()}'.split('.')[0]),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
