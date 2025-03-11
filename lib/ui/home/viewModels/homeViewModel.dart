import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/core/enum/layoutState.dart';
import 'package:digprev_flutter/utils/layoutHelper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewModel extends ChangeNotifier {
  LayoutState _layoutType = LayoutState.mobile;

  LayoutState get layoutType => _layoutType;

  bool _showLeading = false;
  bool get showLeading => _showLeading;

  bool _isScrollable = false;
  bool get isScrollable => _isScrollable;

  Axis _scrollDirection = Axis.horizontal;
  get scrollDirection => _scrollDirection;

  void initState(BuildContext context) {
    _updateLayout(context);
    _updateIsScrollable(context);
    _updateShowLeading(context);
  }

  void _updateShowLeading(BuildContext context) {
    final String basePath = GoRouterState.of(context).topRoute!.name.toString();
    _showLeading = AppRoutes.canPopForName(basePath);
    notifyListeners();
  }

  void _updateIsScrollable(BuildContext context) {
    final String basePath = GoRouterState.of(context).topRoute!.name.toString();
    _isScrollable = AppRoutes.isScrollableForName(basePath);
    notifyListeners();
  }

  void _updateLayout(BuildContext context) {
    _layoutType = getLayoutType(context);
    if (_layoutType == LayoutState.desktop ||
        _layoutType == LayoutState.tablet)
      _scrollDirection = Axis.vertical;
    else
      _scrollDirection = Axis.horizontal;
    notifyListeners();
  }
}
