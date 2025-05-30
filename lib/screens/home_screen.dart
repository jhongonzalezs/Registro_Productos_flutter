import 'package:flutter/material.dart';
import '../widgets/menu_card.dart';
import 'package:product_inventory/screens/agregar_producto_screen.dart';
import 'package:product_inventory/screens/lista_productos_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Menú Principal'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MenuCard(
              icon: Icons.add_box_rounded,
              title: 'Agregar Producto',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AgregarProductoScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            MenuCard(
              icon: Icons.list_alt_rounded,
              title: 'Lista de Productos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListaProductosScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
