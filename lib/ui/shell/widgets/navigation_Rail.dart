import 'package:digprev_flutter/ui/shell/widgets/appNavigationItem.dart';
import 'package:digprev_flutter/ui/start_auth/logout/widgets/logoutWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationRailWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Function() onPressed;

  const NavigationRailWidget({
    required this.selectedIndex,
    required this.onDestinationSelected,
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
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: onPressed,
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 2,
              right: 2,
              top: 20,
            ),
            child: Text(
              'DigPrev',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              LogoutWidget(
                  isExtended: false,
                logoutViewModel: context.read(),
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
