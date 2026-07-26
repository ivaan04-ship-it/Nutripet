// product_screen.dart
// Nutripet Premium UI v1 (base)
//
// Sustituye tu archivo actual por este.
// Diseñado para servir de base del nuevo estilo premium.

import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product producto;

  const ProductScreen({
    super.key,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: producto.imagen.isEmpty
                ? Container(color: Colors.black)
                : Image.network(producto.imagen, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x55000000),
                      Color(0xCC000000),
                      Color(0xFFF4F6F8),
                      Color(0xFFF4F6F8),
                    ],
                    stops: [0.0, .45, .46, 1],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        _circle(const Icon(Icons.arrow_back), () {
                          Navigator.pop(context);
                        }),
                        const Spacer(),
                        _circle(const Icon(Icons.favorite_border), () {}),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Hero(
                    tag: producto.codigoBarras,
                    child: SizedBox(
                      height: 260,
                      child: producto.imagen.isEmpty
                          ? const Icon(Icons.pets, size: 120)
                          : Image.network(producto.imagen),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black26,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("87",
                              style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold)),
                          Text("Nutripet\nScore",
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _card(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(producto.nombre,
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(producto.marca,
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  _card(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Ingredientes",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(producto.ingredientes),
                      ],
                    ),
                  ),
                  _card(
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Composición",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.egg_alt),
                          title: Text("Proteína"),
                          trailing: Text("-- %"),
                        ),
                        ListTile(
                          leading: Icon(Icons.water_drop),
                          title: Text("Grasa"),
                          trailing: Text("-- %"),
                        ),
                        ListTile(
                          leading: Icon(Icons.grass),
                          title: Text("Fibra"),
                          trailing: Text("-- %"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                        label: const Text("Añadir a favoritos"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _card(Widget child) => Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 18),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 16)
          ],
        ),
        child: child,
      );

  Widget _circle(Widget icon, VoidCallback onTap) => Container(
        decoration: const BoxDecoration(
            color: Colors.white, shape: BoxShape.circle),
        child: IconButton(onPressed: onTap, icon: icon),
      );
}
