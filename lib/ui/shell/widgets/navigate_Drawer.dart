import 'package:digprev_flutter/ui/shell/widgets/appNavigationItem.dart';
import 'package:digprev_flutter/ui/start_auth/logout/widgets/logoutWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          children: <Widget>[
            Header(context),
            Expanded(
              child: ListView.builder(
                itemCount: destinations.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < destinations.length) {
                    final AppNavigationItem destination = destinations[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      // Padding entre os itens
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        leading: Icon(destination.icon),
                        title: Text(destination.label),
                        onTap: () => onDestinationSelected(index),
                        selected: selectedIndex == index,
                        selectedColor:
                            Theme.of(context).colorScheme.primaryFixed,
                        selectedTileColor:
                            Theme.of(context).colorScheme.primary,
                      ),
                    );
                  } else
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(),
                    );
                },
              ),
            ),

            LogoutWidget(
              isExtended: true,
              logoutViewModel: context.read()
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget Header(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        Text(
          'DigPrev',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Saúde Digital Alimentar', // Substitua com seu subtítulo
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(),
        ),
      ],
    );
  }
}
