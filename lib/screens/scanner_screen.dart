
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool _escaneado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear código"),
      ),
      body: MobileScanner(
        onDetect: (capture) {
          if (_escaneado) return;

          final barcode = capture.barcodes.first;

          if (barcode.rawValue == null) return;

          _escaneado = true;

          Navigator.pop(context, barcode.rawValue);
        },
      ),
    );
  }
}