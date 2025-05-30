import 'package:flutter/material.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ConfirmDeleteDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmar Eliminación'),
      content: const Text('¿Estás seguro de que deseas eliminar este producto?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), 
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop(); 
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Producto eliminado correctamente.'),
                backgroundColor: Colors.green,
              ),
            );
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
