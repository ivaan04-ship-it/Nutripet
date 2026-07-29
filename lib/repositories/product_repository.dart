
import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/demo_products.dart';
import '../models/product.dart';

class ProductRepository {
  const ProductRepository();

  final CollectionReference<Map<String, dynamic>> _products =
      FirebaseFirestore.instance.collection('Products');

  /// Devuelve todos los productos
  Future<List<Product>> getAllProducts() async {
    try {
      final snapshot = await _products.get();

      if (snapshot.docs.isEmpty) {
        return demoProducts;
      }

      return snapshot.docs
          .map((doc) => Product.fromFirestore(doc.data()))
          .toList();
    } catch (e) {
      return demoProducts;
    }
  }

  /// Busca un producto por código de barras
  Future<Product?> getByBarcode(String barcode) async {
    try {
      final snapshot = await _products
          .where('codigoBarras', isEqualTo: barcode)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return Product.fromFirestore(snapshot.docs.first.data());
      }
    } catch (_) {}

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
    final products = await getAllProducts();

    if (query.trim().isEmpty) {
      return products;
    }

    final text = query.toLowerCase();

    return products.where((product) {
      return product.nombre.toLowerCase().contains(text) ||
          product.marca.toLowerCase().contains(text);
    }).toList();
  }
}