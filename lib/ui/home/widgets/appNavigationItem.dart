import 'package:flutter/material.dart';

List<AppNavigationItem> getNavigationDestinations() {
  return <AppNavigationItem>[
     const AppNavigationItem(
      'Início',
      Icons.home,
    ),
    const AppNavigationItem(
      'Relatórios',
      Icons.leaderboard,
    ),
    const AppNavigationItem(
      'Perfil',
      Icons.person,
    ),
  ];
}

class AppNavigationItem {
  final String label;
  final IconData icon;


  const AppNavigationItem(this.label, this.icon,);
}
