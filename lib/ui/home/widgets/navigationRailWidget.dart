import 'package:digprev_flutter/ui/home/widgets/appNavigationItem.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationRailWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool showLeading;
  final Function() onPressed;

  const NavigationRailWidget({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.showLeading,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      minWidth: 60,
      destinations:
          getNavigationDestinations().map((AppNavigationItem destination) {
            return NavigationRailDestination(
              label: Text(destination.label),
              icon: Icon(destination.icon),
            );
          }).toList(),
      selectedIndex: selectedIndex,
      useIndicator: true,
      onDestinationSelected: onDestinationSelected,
      leading: Column(
        children: <Widget>[
          showLeading
              ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => GoRouter.of(context).pop(),
              )
              : const SizedBox(),
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: onPressed,
          ),
        ],
      ),
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {},
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      indicatorColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      elevation: 10.0,
    );
  }
}
