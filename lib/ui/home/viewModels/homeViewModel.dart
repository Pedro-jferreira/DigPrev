import 'package:digprev_flutter/ui/core/enum/homeLayoutState.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  HomeLayoutState _layoutType = HomeLayoutState.mobile;
  HomeLayoutState get layoutType => _layoutType;

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