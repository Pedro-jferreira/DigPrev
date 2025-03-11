import 'package:digprev_flutter/ui/home/widgets/appNavigationItem.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final int selectedIndex;

  const NavigationDrawerWidget({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final Function(int) onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      indicatorColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      surfaceTintColor:Theme.of(context).colorScheme.surface ,
      onDestinationSelected: onDestinationSelected,
      selectedIndex: selectedIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text('DigPrev', style: Theme.of(context).textTheme.titleSmall),
        ),
        ...getNavigationDestinations().map((
          AppNavigationItem destination,
        ) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: Icon(destination.icon),
          );
        }),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
      ],
    );
  }
}
