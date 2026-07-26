import 'package:flutter/material.dart';

import '../models/product.dart';
import 'score_widget_v.dart';

class ProductHeader extends StatelessWidget {
  final Product product;
  final double score;

  const ProductHeader({
    super.key,
    required this.product,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: product.codigoBarras,
          child: SizedBox(
            height: 240,
            child: product.imagen.isEmpty
                ? const Icon(Icons.pets, size: 120)
                : Image.network(product.imagen),
          ),
        ),
        const SizedBox(height: 16),
        ScoreWidget(
          score: score,
          size: 170,
        ),
        const SizedBox(height: 20),
        Text(
          product.nombre,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          product.marca,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
