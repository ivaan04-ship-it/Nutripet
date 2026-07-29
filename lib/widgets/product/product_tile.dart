
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
    final result = ScoreCalculator.calculate(product);
    final score = result.score.toInt();

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(
                Icons.pets,
                size: 34,
                color: Colors.green,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.nombre,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    product.marca,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: _scoreColor(score),
                        size: 22,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "$score/100",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _scoreColor(score),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        _scoreLabel(score),
                        style: TextStyle(
                          color: _scoreColor(score),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _chip("🐶 Adulto"),
                      _chip("🥩 Carne"),
                      _chip("⭐ Premium"),
                    ],
                  ),

                  const SizedBox(height: 14),

                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Ver análisis →",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static String _scoreLabel(int score) {
    if (score >= 90) return "Excelente";
    if (score >= 80) return "Muy bueno";
    if (score >= 70) return "Bueno";
    if (score >= 60) return "Aceptable";
    return "Evitar";
  }

  static Color _scoreColor(int score) {
    if (score >= 90) return Colors.green;
    if (score >= 80) return Colors.lightGreen;
    if (score >= 70) return Colors.orange;
    return Colors.red;
  }
}