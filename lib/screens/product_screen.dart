
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final Map<String, dynamic> producto;

  const ProductScreen({
    super.key,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    final nombre = producto["product_name"] ?? "Sin nombre";
    final marca = producto["brands"] ?? "Marca desconocida";
    final imagen = producto["image_url"];
    final ingredientes =
        producto["ingredients_text"] ?? "No disponibles";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Producto"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if (imagen != null && imagen.toString().isNotEmpty)
              Center(
                child: Image.network(
                  imagen,
                  height: 220,
                ),
              ),

            const SizedBox(height: 20),

            Text(
              nombre,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              marca,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Ingredientes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(ingredientes),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                label: const Text("Añadir a favoritos"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}