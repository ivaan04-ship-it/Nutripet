// product_screen.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product producto;

  const ProductScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: Stack(
        children: [
          if (producto.imagen.isNotEmpty)
            Positioned.fill(
              child: Image.network(producto.imagen, fit: BoxFit.cover),
            ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(color: Colors.black.withOpacity(0.35)),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Hero(
                    tag: producto.codigoBarras,
                    child: Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: const [BoxShadow(blurRadius: 25,color: Colors.black26)],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: producto.imagen.isEmpty
                            ? const Icon(Icons.pets,size:90)
                            : Image.network(producto.imagen,fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const SizedBox(height:24),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:18,vertical:10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text("Nutripet Score · Próximamente",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height:24),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(producto.nombre,
                            style: const TextStyle(fontSize:26,fontWeight: FontWeight.bold)),
                          const SizedBox(height:8),
                          Text(producto.marca,
                            style: const TextStyle(fontSize:18,color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height:18),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Ingredientes",
                            style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                          const SizedBox(height:12),
                          Text(producto.ingredientes),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height:18),
                  SizedBox(
                    width: double.infinity,
                    height:56,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                      label: const Text("Añadir a favoritos"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
