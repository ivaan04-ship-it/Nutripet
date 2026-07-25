import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const NutripetApp());
  }

  class NutripetApp extends StatelessWidget {
    const NutripetApp({super.key});

      @override
        Widget build(BuildContext context) {
            return MaterialApp(
                  debugShowCheckedModeBanner: false,
                        title: 'Nutripet',
                              theme: AppTheme.lightTheme,
                                    home: const MainScreen(),
                                        );
                                          }
                                          }

                                          class MainScreen extends StatefulWidget {
                                            const MainScreen({super.key});

                                              @override
                                                State<MainScreen> createState() => _MainScreenState();
                                                }

                                                class _MainScreenState extends State<MainScreen> {
                                                  int _selectedIndex = 0;

                                                    final List<Widget> _pages = [
                                                        HomeScreen(),
                                                            SearchScreen(),
                                                                ScanScreen(),
                                                                    FavoritesScreen(),
                                                                        ProfileScreen(),
                                                                          ];

                                                                            void _onItemTapped(int index) {
                                                                                setState(() {
                                                                                      _selectedIndex = index;
                                                                                          });
                                                                                            }

                                                                                              @override
                                                                                                Widget build(BuildContext context) {
                                                                                                    return Scaffold(
                                                                                                          body: _pages[_selectedIndex],
                                                                                                                bottomNavigationBar: NavigationBar(
                                                                                                                        selectedIndex: _selectedIndex,
                                                                                                                                onDestinationSelected: _onItemTapped,
                                                                                                                                        destinations: const [
                                                                                                                                                  NavigationDestination(
                                                                                                                                                              icon: Icon(Icons.home_outlined),
                                                                                                                                                                          selectedIcon: Icon(Icons.home),
                                                                                                                                                                                      label: 'Inicio',
                                                                                                                                                                                                ),
                                                                                                                                                                                                          NavigationDestination(
                                                                                                                                                                                                                      icon: Icon(Icons.search),
                                                                                                                                                                                                                                  label: 'Buscar',
                                                                                                                                                                                                                                            ),
                                                                                                                                                                                                                                                      NavigationDestination(
                                                                                                                                                                                                                                                                  icon: Icon(Icons.qr_code_scanner),
                                                                                                                                                                                                                                                                              label: 'Escanear',
                                                                                                                                                                                                                                                                                        ),
                                                                                                                                                                                                                                                                                                  NavigationDestination(
                                                                                                                                                                                                                                                                                                              icon: Icon(Icons.favorite_border),
                                                                                                                                                                                                                                                                                                                          selectedIcon: Icon(Icons.favorite),
                                                                                                                                                                                                                                                                                                                                      label: 'Favoritos',
                                                                                                                                                                                                                                                                                                                                                ),
                                                                                                                                                                                                                                                                                                                                                          NavigationDestination(
                                                                                                                                                                                                                                                                                                                                                                      icon: Icon(Icons.pets_outlined),
                                                                                                                                                                                                                                                                                                                                                                                  selectedIcon: Icon(Icons.pets),
                                                                                                                                                                                                                                                                                                                                                                                              label: 'Perfil',
                                                                                                                                                                                                                                                                                                                                                                                                        ),
                                                                                                                                                                                                                                                                                                                                                                                                                ],
                                                                                                                                                                                                                                                                                                                                                                                                                      ),
                                                                                                                                                                                                                                                                                                                                                                                                                          );
                                                                                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                                                                                            }