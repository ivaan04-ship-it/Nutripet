//
import '../models/product.dart';

class ScoreResult {
  final double score;
  final String categoria;

  const ScoreResult({
    required this.score,
    required this.categoria,
  });
}

class ScoreCalculator {
  static ScoreResult calculate(Product product) {
    double score = 50;

    // Proteína
    if (product.proteina != null) {
      if (product.proteina! >= 30) {
        score += 20;
      } else if (product.proteina! >= 24) {
        score += 12;
      } else if (product.proteina! >= 18) {
        score += 6;
      } else {
        score -= 10;
      }
    }

    // Grasa
    if (product.grasa != null) {
      if (product.grasa! > 22) {
        score -= 8;
      } else if (product.grasa! >= 10) {
        score += 5;
      }
    }

    // Fibra
    if (product.fibra != null) {
      if (product.fibra! >= 2 && product.fibra! <= 5) {
        score += 5;
      }
    }

    // Cenizas
    if (product.cenizas != null) {
      if (product.cenizas! > 9) {
        score -= 10;
      } else if (product.cenizas! <= 7) {
        score += 5;
      }
    }

    // Humedad
    if (product.humedad != null) {
      if (product.humedad! >= 8) {
        score += 3;
      }
    }

    // Ingredientes
    final ingredientes = product.ingredientes.toLowerCase();

    if (ingredientes.contains("pollo")) score += 4;
    if (ingredientes.contains("pavo")) score += 4;
    if (ingredientes.contains("salmón")) score += 5;
    if (ingredientes.contains("atun")) score += 5;

    if (ingredientes.contains("maíz")) score -= 4;
    if (ingredientes.contains("trigo")) score -= 5;
    if (ingredientes.contains("subproducto")) score -= 8;

    score = score.clamp(0, 100);

    String categoria;

    if (score >= 90) {
      categoria = "Excelente";
    } else if (score >= 75) {
      categoria = "Muy bueno";
    } else if (score >= 60) {
      categoria = "Bueno";
    } else if (score >= 40) {
      categoria = "Regular";
    } else {
      categoria = "Malo";
    }

    return ScoreResult(
      score: score,
      categoria: categoria,
    );
  }
}