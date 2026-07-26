//
class Product {
  final String nombre;
  final String marca;
  final String imagen;
  final String ingredientes;
  final String codigoBarras;

  const Product({
    required this.nombre,
    required this.marca,
    required this.imagen,
    required this.ingredientes,
    required this.codigoBarras,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      nombre: json["product_name"] ?? "Sin nombre",
      marca: json["brands"] ?? "Marca desconocida",
      imagen: json["image_url"] ?? "",
      ingredientes: json["ingredients_text"] ?? "No disponibles",
      codigoBarras: json["code"] ?? "",
    );
  }
}