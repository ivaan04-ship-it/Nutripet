
class Product {
  final String nombre;
  final String marca;

  /// URL de la imagen (Firestore) o imagen de OpenFoodFacts
  final String imagen;

  final String ingredientes;
  final String codigoBarras;

  final double? proteina;
  final double? grasa;
  final double? fibra;
  final double? cenizas;
  final double? humedad;

  final String categoria;

  const Product({
    required this.nombre,
    required this.marca,
    required this.imagen,
    required this.ingredientes,
    required this.codigoBarras,
    this.proteina,
    this.grasa,
    this.fibra,
    this.cenizas,
    this.humedad,
    this.categoria = "",
  });

  /// OpenFoodFacts
  factory Product.fromJson(Map<String, dynamic> json) {
    final nutriments = json["nutriments"] ?? {};

    double? leerNumero(dynamic valor) {
      if (valor == null) return null;
      if (valor is num) return valor.toDouble();
      return double.tryParse(valor.toString());
    }

    return Product(
      nombre: json["product_name"] ?? "Sin nombre",
      marca: json["brands"] ?? "Marca desconocida",
      imagen: json["image_url"] ?? "",
      ingredientes: json["ingredients_text"] ?? "No disponibles",
      codigoBarras: json["code"] ?? "",
      categoria: json["categories"] ?? "",
      proteina: leerNumero(nutriments["proteins_100g"]),
      grasa: leerNumero(nutriments["fat_100g"]),
      fibra: leerNumero(nutriments["fiber_100g"]),
      cenizas: leerNumero(nutriments["ash_100g"]),
      humedad: leerNumero(nutriments["moisture_100g"]),
    );
  }

  /// Firestore
  factory Product.fromFirestore(Map<String, dynamic> data) {
    double? leerNumero(dynamic valor) {
      if (valor == null) return null;
      if (valor is num) return valor.toDouble();
      return double.tryParse(valor.toString());
    }

    return Product(
      nombre: data["nombre"] ?? "",
      marca: data["marca"] ?? "",
      imagen: data["imagen"] ?? "",
      ingredientes: (data["ingredientes"] is List)
          ? (data["ingredientes"] as List).join(", ")
          : "",
      codigoBarras: data["codigoBarras"] ?? "",
      categoria: data["categoria"] ?? "",
      proteina: leerNumero(data["proteina"]),
      grasa: leerNumero(data["grasa"]),
      fibra: leerNumero(data["fibra"]),
      cenizas: leerNumero(data["cenizas"]),
      humedad: leerNumero(data["humedad"]),
    );
  }

  bool get tieneDatosNutricionales =>
      proteina != null ||
      grasa != null ||
      fibra != null ||
      cenizas != null ||
      humedad != null;
}