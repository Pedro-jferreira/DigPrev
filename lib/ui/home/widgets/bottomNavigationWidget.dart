import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    required this.onTap,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);
  final ValueChanged<int> onTap;
  final int currentIndex;

  @override
  _BottomNavigationComponentState createState() =>
      _BottomNavigationComponentState();
}

class _BottomNavigationComponentState extends State<BottomNavigationWidget> {
  final List<Map<String, dynamic>> items = [
    {
      'route': '/home',
      'label': 'Início',
      'icon': Icons.home,
      'outlinedIcon': Icons.home_outlined,
    },
    {
      'route': '/reports',
      'label': 'Relatórios',
      'icon': Icons.leaderboard,
      'outlinedIcon': Icons.leaderboard_outlined,
    },
    {
      'route': '/profile',
      'label': 'Perfil',
      'icon': Icons.person,
      'outlinedIcon': Icons.person_outline,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      selectedItemColor: Theme.of(context).colorScheme.primaryContainer,
      unselectedItemColor: Theme.of(context).colorScheme.secondaryContainer,
      elevation: 2,
      // Sombra equivalente a shadow(8.dp)
      items:
          items.map((item) {
            bool isSelected = items.indexOf(item) == widget.currentIndex;
            return BottomNavigationBarItem(
              icon: Icon(
                isSelected ? item['icon'] : item['outlinedIcon'],
                size: 24,
              ),
              label: item['label'],
            );
          }).toList(),
    );
  }
}
