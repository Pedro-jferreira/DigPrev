import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  final PageController pageController;

  const BottomNavigationWidget({Key? key, required this.pageController}) : super(key: key);

  @override
  _BottomNavigationComponentState createState() => _BottomNavigationComponentState();
}

class _BottomNavigationComponentState extends State<BottomNavigationWidget> {
  int selectedItem = 0;

  final List<Map<String, dynamic>> items = [
    {'route': '/home', 'label': 'Início', 'icon': Icons.home, 'outlinedIcon': Icons.home_outlined},
    {'route': '/reports', 'label': 'Relatórios', 'icon': Icons.bar_chart, 'outlinedIcon': Icons.bar_chart_outlined},
    {'route': '/profile', 'label': 'Perfil', 'icon': Icons.person, 'outlinedIcon': Icons.person_outline},
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedItem = index;
    });

    // Navegação para diferentes rotas
    if (index == 1) {
      Navigator.pushNamed(context, '/reports', arguments: {'userId': '1'});
    } else {
      Navigator.pushNamed(context, items[index]['route']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedItem,
      onTap: _onItemTapped,
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      selectedItemColor: Theme.of(context).colorScheme.primaryContainer,
      unselectedItemColor: Theme.of(context).colorScheme.secondaryContainer,
      elevation: 2, // Sombra equivalente a shadow(8.dp)
      items: items.map((item) {
        bool isSelected = items.indexOf(item) == selectedItem;
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
