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
  