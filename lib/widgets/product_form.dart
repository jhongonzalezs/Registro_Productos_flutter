import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  final Function(String, String, String, String) onSubmit;

  const ProductForm({super.key, required this.onSubmit});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _refController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _refController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(
        _refController.text,
        _nameController.text,
        _priceController.text,
        _descController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _refController,
            decoration: const InputDecoration(
              labelText: 'Referencia',
              border: OutlineInputBorder(),
            ),
            validator: (value) => value == null || value.isEmpty
                ? 'Ingrese una referencia'
                : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nombre del Producto',
              border: OutlineInputBorder(),
            ),
            validator: (value) => value == null || value.isEmpty
                ? 'Ingrese un nombre'
                : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _priceController,
            decoration: const InputDecoration(
              labelText: 'Precio',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese un precio';
              }
              if (double.tryParse(value) == null) {
                return 'Ingrese un número válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _descController,
            decoration: const InputDecoration(
              labelText: 'Descripción',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            validator: (value) => value == null || value.isEmpty
                ? 'Ingrese una descripción'
                : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
            label: const Text('Agregar Producto'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
