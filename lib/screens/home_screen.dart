//
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/pet_food_api.dart';
import 'product_screen.dart';
import 'scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _escanear(BuildContext context) async {
    final codigo = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => const ScannerScreen(),
      ),
    );

    if (codigo == null || !context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Buscando producto..."),
        duration: Duration(seconds: 1),
      ),
    );

    final Product? producto =
        await PetFoodApi.buscarProducto(codigo);

    if (!context.mounted) return;

    if (producto != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductScreen(
            producto: producto,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Producto no encontrado"),
          content: const Text(
            "No existe información para este código de barras.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Aceptar"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              "🐶 Nutripet",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "¿Qué quieres hacer hoy?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar alimento...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () => _escanear(context),
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text(
                  "Escanear código de barras",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: const [
                Expanded(
                  child: _MenuCard(
                    icon: Icons.pets,
                    title: "Mi mascota",
                    subtitle: "Añade tu perro o gato",
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: _MenuCard(
                    icon: Icons.favorite,
                    title: "Favoritos",
                    subtitle: "Tus alimentos",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "💡 Consejo del día",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Haz el cambio de alimento de forma gradual durante 7 días para evitar problemas digestivos.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Icon(
              icon,
              size: 42,
              color: Colors.green,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}