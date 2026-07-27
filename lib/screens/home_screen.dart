
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../repositories/product_repository.dart';
import '../widgets/Search_box.dart';
import '../widgets/product_tile.dart';
import 'product_screen.dart';
import 'scanner_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductRepository repository = const ProductRepository();

  final TextEditingController searchController =
      TextEditingController();

  List<Product> products = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final data = await repository.getAllProducts();

    setState(() {
      products = data;
      loading = false;
    });
  }

  Future<void> search(String text) async {
    final result = await repository.search(text);

    setState(() {
      products = result;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nutripet"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.qr_code_scanner),
      onPressed: () async {
  final codigo = await Navigator.push<String>(
    context,
    MaterialPageRoute(
      builder: (_) => const ScannerScreen(),
    ),
  );

  if (!mounted || codigo == null) return;

  final producto = await repository.getByBarcode(codigo);

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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Producto no encontrado"),
      ),
    );
  },
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBox(
              controller: searchController,
              onChanged: search,
            ),
          ),
                    Expanded(
            child: loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : products.isEmpty
                    ? const Center(
                        child: Text(
                          "No se encontraron productos",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ProductTile(
                              product: product,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductScreen(
                                      producto: product,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}