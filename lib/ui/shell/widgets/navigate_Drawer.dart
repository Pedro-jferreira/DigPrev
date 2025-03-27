import 'package:digprev_flutter/ui/shell/widgets/appNavigationItem.dart';
import 'package:digprev_flutter/ui/start_auth/logout/widgets/logoutWidget.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({
    required this.selectedIndex,
    required this.onDestinationSelected,

    super.key,
  });

  final int selectedIndex;
  final Function(int) onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final List<AppNavigationItem> destinations = getNavigationDestinations();
    return Drawer(
      elevation: 20.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Header(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
                ...destinations.map(
                  (AppNavigationItem destination) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      leading: Icon(destination.icon),
                      title: Text(destination.label),
                      onTap:
                          () => onDestinationSelected(
                            destinations.indexOf(destination),
                          ),
                      selected:
                          selectedIndex == destinations.indexOf(destination),
                      selectedColor: Theme.of(context).colorScheme.primaryFixed,
                      selectedTileColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
              ],
            ),
            const Spacer(),

            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
              child: const LogoutWidget(isExtended: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget Header(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
              bottom: MediaQuery.of(context).size.height * 0.01
          ),
          child: Text(
            'DigPrev',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Text(
          'Saúde Digital Alimentar', // Substitua com seu subtítulo
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
