import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:digprev_flutter/ui/shell/viewModels/shell_View_Model.dart';
import 'package:digprev_flutter/ui/shell/widgets/bottom_Navigation_Bar.dart';
import 'package:digprev_flutter/ui/shell/widgets/navigate_Drawer.dart';
import 'package:digprev_flutter/ui/shell/widgets/navigation_Rail.dart';
import 'package:digprev_flutter/ui/shell/widgets/top_App_Bar.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted)
        widget.viewModel.initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.viewModel.layoutType) {
      case LayoutState.desktop:
        return buildNavigationDrawerScaffold(context);
      case LayoutState.tablet:
        return buildNavigationRailScaffold(context);
      case LayoutState.smallTablet:
        return buildBottomBarScaffold(context);
      case LayoutState.mobile:
        return buildBottomBarScaffold(context);
    }
  }
}
