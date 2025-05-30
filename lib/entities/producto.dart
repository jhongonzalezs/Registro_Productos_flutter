class Producto {
  final String referencia;
  final String nombre;
  final String precio;
  final String descripcion;
  final DateTime fechaAgregado; 

  Producto({
    required this.referencia,
    required this.nombre,
    required this.precio,
    required this.descripcion,
  }) : fechaAgregado = DateTime.now(); 
}
