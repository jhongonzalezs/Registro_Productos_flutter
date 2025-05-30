import 'package:flutter/material.dart';
import '../widgets/producto_card.dart';
import '../widgets/confirm_delete_dialog.dart';
import '../widgets/stock_summary.dart';
import '../data/productos_data.dart';

class ListaProductosScreen extends StatefulWidget {
  const ListaProductosScreen({super.key});

  @override
  State<ListaProductosScreen> createState() => _ListaProductosScreenState();
}

class _ListaProductosScreenState extends State<ListaProductosScreen> {
  void _confirmarEliminarProducto(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDeleteDialog(
          onConfirm: () {
            setState(() {
              productos.removeAt(index);
            });
          },
        );
      },
    );
  }

  int get totalProductos => productos.length;

  double get valorTotalStock {
    return productos.fold(
      0.0,
      (suma, producto) {
        final precioSinPuntos = producto.precio.replaceAll('.', '');
        final precio = double.tryParse(precioSinPuntos) ?? 0.0;
        return suma + precio;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
        backgroundColor: Colors.blueGrey,
      ),
      body: productos.isEmpty
          ? const Center(child: Text('No hay productos agregados.'))
          : Column(
              children: [
                StockSummary(
                  totalProductos: totalProductos,
                  valorTotalStock: valorTotalStock,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: productos.length,
                    itemBuilder: (context, index) {
                      return ProductoCard(
                        producto: productos[index],
                        onDelete: () => _confirmarEliminarProducto(index),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
