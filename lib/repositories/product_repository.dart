import '../data/demo_products.dart';
import '../models/product.dart';

class ProductRepository {
  const ProductRepository();

  /// Devuelve todos los productos
  Future<List<Product>> getAllProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return demoProducts;
  }

  /// Busca un producto por código de barras
  Future<Product?> getByBarcode(String barcode) async {
    await Future.delayed(const Duration(milliseconds: 200));

    try {
      return demoProducts.firstWhere(
        (p) => p.codigoBarras == barcode,
      );
    } catch (_) {
      return null;
    }
  }

  /// Busca por nombre o marca
  Future<List<Product>> search(String query) async {
    await Future.delayed(const Duration(milliseconds: 200));

    if (query.trim().isEmpty) {
      return demoProducts;
    }

    final text = query.toLowerCase();

    return demoProducts.where((product) {
      return product.nombre.toLowerCase().contains(text) ||
          product.marca.toLowerCase().contains(text);
    }).toList();
  }
}