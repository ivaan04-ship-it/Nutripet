import 'dart:ui';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/score_calculator.dart';
import '../widgets/score_widget_v.dart';

class ProductScreen extends StatelessWidget {
  final Product producto;

  const ProductScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final resultado = ScoreCalculator.calculate(producto);

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
                        _circle(const Icon(Icons.arrow_back), () => Navigator.pop(context)),
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
                  const SizedBox(height: 20),
                  ScoreWidget(score: resultado.score, size: 170),
                  const SizedBox(height: 24),
                  _card(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(producto.nombre, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(producto.marca, style: const TextStyle(color: Colors.grey)),
                  ])),
                  _card(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text("Ingredientes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(producto.ingredientes),
                  ])),
                  _card(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text("Composición", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _row(Icons.egg_alt,"Proteína",producto.proteina),
                    _row(Icons.water_drop,"Grasa",producto.grasa),
                    _row(Icons.grass,"Fibra",producto.fibra),
                    _row(Icons.science,"Cenizas",producto.cenizas),
                    _row(Icons.opacity,"Humedad",producto.humedad),
                  ])),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                        label: Text("Añadir a favoritos • ${resultado.categoria}"),
                      ),
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

  static Widget _row(IconData icon, String t, double? v)=>ListTile(
    leading: Icon(icon),
    title: Text(t),
    trailing: Text(v!=null ? "${v.toStringAsFixed(1)} %" : "--"),
  );

  Widget _card(Widget child)=>Container(
    margin: const EdgeInsets.fromLTRB(16,0,16,18),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 16)],
    ),
    child: child,
  );

  Widget _circle(Widget icon, VoidCallback onTap)=>Container(
    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    child: IconButton(onPressed: onTap, icon: icon),
  );
}
