
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../services/pet_food_api.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear código"),
      ),
      body: MobileScanner(
        onDetect: (capture) async {
          final barcode = capture.barcodes.first;

          if (barcode.rawValue == null) return;

          final codigo = barcode.rawValue!;

          final producto = await PetFoodApi.buscarProducto(codigo);

          if (!context.mounted) return;

          if (producto != null) {
            final nombre = producto["product_name"] ?? "Sin nombre";
            final marca = producto["brands"] ?? "Marca desconocida";

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("✅ $nombre ($marca)"),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("❌ Producto no encontrado"),
              ),
            );
          }

          Navigator.pop(context, codigo);
        },
      ),
    );
  }
}