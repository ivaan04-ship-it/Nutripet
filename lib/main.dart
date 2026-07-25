import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NutripetApp());
  }

  class NutripetApp extends StatelessWidget {
    const NutripetApp({super.key});

      @override
        Widget build(BuildContext context) {
            return MaterialApp(
                  title: 'Nutripet',
                        debugShowCheckedModeBanner: false,
                              theme: AppTheme.lightTheme,
                                    home: const HomeScreen(),
                                        );
                                          }
                                          }