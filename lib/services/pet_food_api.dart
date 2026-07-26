
import 'dart:convert';
import 'package:http/http.dart' as http;

class PetFoodApi {
  static Future<Map<String, dynamic>?> buscarProducto(String barcode) async {
    final url = Uri.parse(
      'https://world.openpetfoodfacts.org/api/v2/product/$barcode.json',
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return null;
    }

    final data = json.decode(response.body);

    if (data["status"] != 1) {
      return null;
    }

    return data["product"];
  }
}