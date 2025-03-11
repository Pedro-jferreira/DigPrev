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

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  Widget buildBottomBarScaffold(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(leading: widget.viewModel.showLeading),
      body: widget.child,
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: widget.child.currentIndex,
        onTap: (int index) => widget.child.goBranch(index),
      ),
    );
  }

  Widget buildNavigationRailScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: <Widget>[
          NavigationRailWidget(
            selectedIndex: widget.child.currentIndex,
            onDestinationSelected: (int index) => widget.child.goBranch(index),
            onPressed: () {
              openDrawer();
            },
          ),
          Expanded(child: Center(child: widget.child)),
        ],
      ),
      drawer: NavigationDrawerWidget(
        selectedIndex: widget.child.currentIndex,
        onDestinationSelected: (int index) => widget.child.goBranch(index),

      ),
    );
  }

  Widget buildNavigationDrawerScaffold(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationDrawerWidget(
            selectedIndex: widget.child.currentIndex,
            onDestinationSelected: (int index) => widget.child.goBranch(index),
          ),


          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.initState(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.viewModel.layoutType) {
      case HomeLayoutState.desktop:
        return buildNavigationDrawerScaffold(context);
      case HomeLayoutState.tablet:
        return buildNavigationRailScaffold(context);
      case HomeLayoutState.smallTablet:
        return buildBottomBarScaffold(context);
      case HomeLayoutState.mobile:
        return buildBottomBarScaffold(context);
    }
  }
}
