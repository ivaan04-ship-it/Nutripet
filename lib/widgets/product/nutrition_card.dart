import 'package:flutter/material.dart';

class NutritionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final double? value;
  final String unit;

  const NutritionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.unit = "%",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Text(
          value != null ? "${value!.toStringAsFixed(1)} $unit" : "--",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
