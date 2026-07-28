import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../services/nutripet_score.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductTile({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey.shade200,
          child: const Icon(Icons.pets),
        ),
        title: Text(
          product.nombre,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(product.marca),
        trailing: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: _scoreColor(product),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
  '${ScoreCalculator.calculate(product).score.toInt()}/100',
  style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
),
        ),
      ),
    );
  }


  Color _scoreColor(Product product) {
    final resultado = ScoreCalculator.calculate(product);
    final score = resultado.score;

    if (score >= 90) return Colors.green;
    if (score >= 75) return Colors.lightGreen;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }
}