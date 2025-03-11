import 'package:digprev_flutter/ui/core/enum/homeLayoutState.dart';
import 'package:flutter/material.dart';

HomeLayoutState getLayoutType(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;

  if (width >= 1024) {
    return HomeLayoutState.desktop;
  } else if (width >= 800) {
    return HomeLayoutState.tablet;
  } else if (width >= 550) {
    return HomeLayoutState.smallTablet;
  } else {
    return HomeLayoutState.mobile;
  }
}

double getContentWidth(BoxConstraints constraints, HomeLayoutState layoutType) {
  switch (layoutType) {
    case HomeLayoutState.mobile:
      return constraints.maxWidth * 0.95;
    case HomeLayoutState.smallTablet:
      return constraints.maxWidth * 0.85;
    case HomeLayoutState.tablet:
      return constraints.maxWidth * 0.75;
    case HomeLayoutState.desktop:
      return constraints.maxWidth * 0.65;
  }
}