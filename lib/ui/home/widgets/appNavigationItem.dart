import 'package:flutter/material.dart';

List<AppNavigationItem> getNavigationDestinations() {
  return <AppNavigationItem>[
     const AppNavigationItem(
      'Início',
      Icons.home,
      Icons.home,
    ),
    const AppNavigationItem(
      'Relatórios',
      Icons.leaderboard,
      Icons.leaderboard,
    ),
    const AppNavigationItem(
      'Perfil',
      Icons.person,
      Icons.person,
    ),
  ];
}

class AppNavigationItem {
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  const AppNavigationItem(this.label, this.icon, this.selectedIcon);
}
