import 'package:digprev_flutter/ui/home/widgets/appNavigationItem.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int currentIndex;

  const BottomNavigationWidget({
    required this.onTap,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 10.0,
      currentIndex: currentIndex,
      onTap: onTap,
      items:
          getNavigationDestinations().map((AppNavigationItem destination) {
            return BottomNavigationBarItem(
              label: destination.label,
              icon: Icon(destination.icon),
            );
          }).toList(),
    );
  }
}
