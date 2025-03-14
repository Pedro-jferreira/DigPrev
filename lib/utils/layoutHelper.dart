
import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:flutter/material.dart';

LayoutState getLayoutType(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;

  if (width >= 1024) {
    return LayoutState.desktop;
  } else if (width >= 800) {
    return LayoutState.tablet;
  } else if (width >= 550) {
    return LayoutState.smallTablet;
  } else {
    return LayoutState.mobile;
  }
}

double getContentWidth(BoxConstraints constraints, LayoutState layoutType) {
  switch (layoutType) {
    case LayoutState.mobile:
      return constraints.maxWidth * 0.95;
    case LayoutState.smallTablet:
      return constraints.maxWidth * 0.85;
    case LayoutState.tablet:
      return constraints.maxWidth * 0.75;
    case LayoutState.desktop:
      return constraints.maxWidth * 0.65;
  }
}