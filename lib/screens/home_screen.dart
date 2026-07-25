import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

    @override
      Widget build(BuildContext context) {
          return Scaffold(
                appBar: AppBar(
                        title: const Text('Nutripet'),
                                centerTitle: true,
                                      ),
                                            body: const Center(
                                                    child: Text(
                                                              '¡Bienvenido a Nutripet! 🐶🐱',
                                                                        style: TextStyle(
                                                                                    fontSize: 24,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                          ),
                                                                                                                  ),
                                                                                                                        ),
                                                                                                                            );
                                                                                                                              }
                                                                                                                              }