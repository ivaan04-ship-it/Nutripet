//
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class PetFoodApi {
  static Future<Product?> buscarProducto(String barcode) async {
    final url = Uri.parse(
      'https://world.openpetfoodfacts.org/api/v2/product/$barcode.json',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        return null;
      }

      final data = json.decode(response.body);

      if (data["status"] != 1) {
        return null;
      }

      return Product.fromJson(data["product"]);
    } catch (e) {
      return null;
    }
  }
}