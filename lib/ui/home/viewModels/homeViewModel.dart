import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/core/enum/homeLayoutState.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewModel extends ChangeNotifier {
  HomeLayoutState _layoutType = HomeLayoutState.mobile;
  HomeLayoutState get layoutType => _layoutType;

  bool _showLeading = false;
  bool get  showLeading => _showLeading;
  bool _isScrollable = false;
  bool get  isScrollable => _isScrollable;



  void updateShowLeading(BuildContext context) {
    final String basePath = GoRouterState.of(context).topRoute!.name.toString();
    _showLeading = AppRoutes.canPopForName(basePath);
    notifyListeners();
  }
  void updateIsScrollable(BuildContext context) {
    final String basePath = GoRouterState.of(context).topRoute!.name.toString();
    _isScrollable = AppRoutes.isScrollableForName(basePath);
    notifyListeners();
  }

  void updateLayout(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width >= 1024) {
      _layoutType = HomeLayoutState.desktop;
    } else if (width >= 800) {
      _layoutType = HomeLayoutState.tablet;
    } else if (width >= 550) {
      _layoutType = HomeLayoutState.smallTablet;
    } else {
      _layoutType = HomeLayoutState.mobile;
    }
    notifyListeners();
  }
}