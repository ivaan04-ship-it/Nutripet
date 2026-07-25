import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

    @override
      Widget build(BuildContext context) {
          return Scaffold(
                appBar: AppBar(
                        title: const Text("Buscar alimento"),
                              ),
                                    body: const Center(
                                            child: Text(
                                                      "🔍 Próximamente podrás buscar alimentos",
                                                                style: TextStyle(fontSize: 18),
                                                                          textAlign: TextAlign.center,
                                                                                  ),
                                                                                        ),
                                                                                            );
                                                                                              }
                                                                                              }