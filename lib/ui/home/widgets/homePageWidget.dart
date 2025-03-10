import 'package:digprev_flutter/ui/core/enum/homeLayoutState.dart';
import 'package:digprev_flutter/ui/home/viewModels/homeViewModel.dart';
import 'package:digprev_flutter/ui/home/widgets/bottomNavigationWidget.dart';
import 'package:digprev_flutter/ui/home/widgets/navigateDrawerWidget.dart';
import 'package:digprev_flutter/ui/home/widgets/navigationRailWidget.dart';
import 'package:digprev_flutter/ui/home/widgets/topAppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageWidget extends StatefulWidget {
  final StatefulNavigationShell child;
  final HomeViewModel viewModel;

  const HomePageWidget({
    required this.child,
    required this.viewModel,
    super.key,
  });

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late bool showNavigationDrawer;
  bool showLeading = false;

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  Widget buildBottomBarScaffold() {
    return Scaffold(
      appBar: TopBarWidget(),
      body: widget.child,
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: widget.child.currentIndex,
        onTap: (int index) => widget.child.goBranch(index),
      ),
    );
  }

  Widget buildNavigationRailScaffold() {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: NavigationRailWidget(
              selectedIndex: widget.child.currentIndex,
              onDestinationSelected:
                  (int index) => widget.child.goBranch(index),
              showLeading: showLeading,
              onPressed: () {
                openDrawer();
              },
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: Center(child: widget.child)),
        ],
      ),
      drawer: NavigationDrawerWidget(
        selectedIndex: widget.child.currentIndex,
        onDestinationSelected:
            (int index) => widget.child.goBranch(index),
      ),
    );
  }

  Widget buildNavigationDrawerScaffold(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: NavigationDrawerWidget(
              selectedIndex: widget.child.currentIndex,
              onDestinationSelected:
                  (int index) => widget.child.goBranch(index),
            ),
          ),
          Expanded(child: Center(child: widget.child)),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.updateLayout(context);
    });
  }

  Widget buildLayout(HomeLayoutState layoutType, BuildContext context) {
    switch (layoutType) {
      case HomeLayoutState.desktop:
        return buildNavigationDrawerScaffold(context);
      case HomeLayoutState.tablet:
        return buildNavigationRailScaffold();
      case HomeLayoutState.smallTablet:
        return buildBottomBarScaffold();
      case HomeLayoutState.mobile:
      return buildBottomBarScaffold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(widget.viewModel.layoutType, context);
  }
}
