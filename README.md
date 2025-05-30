# 📦 Aplicación Flutter: Registro de Productos

Esta aplicación Flutter permite registrar y administrar productos de forma **temporal**, sin necesidad de almacenamiento persistente. Es ideal como demostración o práctica de manejo de estado y formularios en Flutter.

---

## ✨ Funcionalidades

- Registro temporal de productos.
- Visualización en lista de productos agregados.
- Eliminación individual de productos.
- Cálculo del total de productos y del valor acumulado.

---

## 🧾 Campos del formulario

La interfaz incluye los siguientes campos para registrar productos:

- **Referencia (Ref)**: Código único del producto.
- **Nombre**: Nombre del producto.
- **Precio**: Valor numérico.
- **Fecha**: Fecha de registro (puede ser capturada automáticamente o elegida por el usuario).
- **Descripción**: Breve detalle o características del producto.

---

## 🖱️ Controles disponibles

- **Agregar**: Añade un nuevo producto a la lista.
- **Eliminar**: Quita un producto existente de la lista (usando un `IconButton` por producto).

---

## 🛠️ Comportamiento

### ➕ Agregar Producto
Al completar todos los campos y pulsar el botón **Agregar**, el producto se añade a un mapa y se muestra en pantalla.

### 🗑️ Eliminar Producto
Cada producto en la lista tiene un botón o ícono que permite eliminarlo individualmente.

---

## 🧩 Interfaz de usuario

### Pantalla principal:

- Formulario con campos de entrada:
  - Referencia
  - Nombre
  - Precio
  - Fecha
  - Descripción
- Botón **Agregar**
- Lista de productos registrados
- Resumen:
  - Total de productos agregados.
  - Valor acumulado del precio de los productos.

### Widget de lista de productos:

- Implementado con `ListView`.
- Cada ítem muestra:
  - Referencia
  - Nombre
  - Precio
  - Descripción
  - Botón para eliminar el producto

---

## 🚫 Notas

- ❗ **No hay persistencia**: los productos se eliminarán al cerrar la aplicación.
- Esta aplicación está diseñada para demostrar el manejo de formularios, estado local y diseño de interfaces simples en Flutter.

---

## 📜 Licencia

Este proyecto está bajo la licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
