import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
      return ThemeData(
            useMaterial3: true,
                  scaffoldBackgroundColor: const Color(0xFFF8F8F4),

                        colorScheme: ColorScheme.fromSeed(
                                seedColor: const Color(0xFF66BB6A),
                                        brightness: Brightness.light,
                                              ),

                                                    appBarTheme: const AppBarTheme(
                                                            backgroundColor: Color(0xFFF8F8F4),
                                                                    foregroundColor: Colors.black87,
                                                                            elevation: 0,
                                                                                    centerTitle: true,
                                                                                          ),

                                                                                                elevatedButtonTheme: ElevatedButtonThemeData(
                                                                                                        style: ElevatedButton.styleFrom(
                                                                                                                  backgroundColor: const Color(0xFF66BB6A),
                                                                                                                            foregroundColor: Colors.white,
                                                                                                                                      minimumSize: const Size(double.infinity, 55),
                                                                                                                                                shape: RoundedRectangleBorder(
                                                                                                                                                            borderRadius: BorderRadius.circular(18),
                                                                                                                                                                      ),
                                                                                                                                                                              ),
                                                                                                                                                                                    ),

                                                                                                                                                                                          inputDecorationTheme: InputDecorationTheme(
                                                                                                                                                                                                  filled: true,
                                                                                                                                                                                                          fillColor: Colors.white,
                                                                                                                                                                                                                  border: OutlineInputBorder(
                                                                                                                                                                                                                            borderRadius: BorderRadius.circular(18),
                                                                                                                                                                                                                                      borderSide: BorderSide.none,
                                                                                                                                                                                                                                              ),
                                                                                                                                                                                                                                                      prefixIconColor: Colors.grey,
                                                                                                                                                                                                                                                            ),

                                                                                                                                                                                                                                                                  cardTheme: CardThemeData(
                                                                                                                                                                                                                                                                          color: Colors.white,
                                                                                                                                                                                                                                                                                  elevation: 2,
                                                                                                                                                                                                                                                                                          shape: RoundedRectangleBorder(
                                                                                                                                                                                                                                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                                                                                                                                                                                                                                            ),
                                                                                                                                                                                                                                                                                                                  ),
                                                                                                                                                                                                                                                                                                                      );
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                        }