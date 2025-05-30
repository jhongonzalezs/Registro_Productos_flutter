import 'package:flutter/material.dart';
import '../widgets/product_form.dart';
import '../entities/producto.dart';
import '../data/productos_data.dart';

class AgregarProductoScreen extends StatelessWidget {
  const AgregarProductoScreen({super.key});

  void _agregarProducto(
    String ref,
    String nombre,
    String precio,
    String descripcion,
    BuildContext context,
  ) {
    final productoExistente = productos.firstWhere(
      (producto) => producto.referencia == ref,
      orElse: () => Producto(
        referencia: '',
        nombre: '',
        precio: '0',
        descripcion: '',
      ),
    );

    if (productoExistente.referencia.isEmpty) {
      final nuevoProducto = Producto(
        referencia: ref,
        nombre: nombre,
        precio: precio,
        descripcion: descripcion,
      );

      productos.add(nuevoProducto);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto agregado correctamente')),
      );

      print('Producto agregado: ${nuevoProducto.nombre}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: La referencia "$ref" ya está en uso.')),
      );

      print('Error: La referencia $ref ya está en uso.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Producto'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: ProductForm(
            onSubmit: (ref, nombre, precio, descripcion) {
              _agregarProducto(ref, nombre, precio, descripcion, context);
            },
          ),
        ),
      ),
    );
  }
}
