import 'package:flutter/material.dart';

List<AppNavigationItem> getNavigationDestinations() {
  return <AppNavigationItem>[
     const AppNavigationItem(
      'Início',
      Icons.home_rounded,
    ),
    const AppNavigationItem(
      'Relatórios',
      Icons.assignment,
    ),
    const AppNavigationItem(
      'Dados',
      Icons.admin_panel_settings,
    ),
  ];
}

class AppNavigationItem {
  final String label;
  final IconData icon;


  const AppNavigationItem(this.label, this.icon,);
}
