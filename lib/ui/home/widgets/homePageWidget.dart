import 'package:digprev_flutter/ui/core/enum/layoutState.dart';
import 'package:digprev_flutter/ui/home/viewModels/homeViewModel.dart';
import 'package:digprev_flutter/ui/home/widgets/bottomNavigationWidget.dart';
import 'package:digprev_flutter/ui/home/widgets/navigateDrawerWidget.dart';
import 'package:digprev_flutter/ui/home/widgets/navigationRailWidget.dart';
import 'package:digprev_flutter/ui/home/widgets/topAppBarWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/restart/viewModels/restartViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/restart/widgets/restartButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageWidget extends StatefulWidget {
  final StatefulNavigationShell child;
  final HomeViewModel viewModel;
  final RestartViewModel restartViewModel;

  const HomePageWidget({
    required this.child,
    required this.viewModel,
    required this.restartViewModel,
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
      floatingActionButton: floatingActionButton(),
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
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget? floatingActionButton() {
    if (widget.restartViewModel.responseCard == null)
      return RestartButtonWidget(viewModel: widget.restartViewModel);

    return null;
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
      floatingActionButton: floatingActionButton(),
    );
  }

  @override
  void initState() {
    widget.restartViewModel.observerPending();
    super.initState();
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
