//
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../services/pet_food_api.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool _procesando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear código"),
      ),
      body: MobileScanner(
        onDetect: (capture) async {
          if (_procesando) return;
          _procesando = true;

          final barcode = capture.barcodes.first;

          if (barcode.rawValue == null) {
            _procesando = false;
            return;
          }

          final codigo = barcode.rawValue!;

          final producto = await PetFoodApi.buscarProducto(codigo);

          if (!mounted) return;

          Navigator.pop(context, {
            "codigo": codigo,
            "producto": producto,
          });
        },
      ),
    );
  }
}