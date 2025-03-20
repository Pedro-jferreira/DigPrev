import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:flutter/material.dart';

/// Determina o tipo de layout com base na largura da tela.
LayoutState determineLayoutState(BuildContext context) {
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

/// Calcula a largura ideal do conteúdo com base no layout atual.
double calculateContentWidth(
  BoxConstraints constraints,
  LayoutState layoutType,
) {
  switch (layoutType) {
    case LayoutState.mobile:
      return constraints.maxWidth * 1.0;
    case LayoutState.smallTablet:
      return constraints.maxWidth * 0.85;
    case LayoutState.tablet:
      return constraints.maxWidth * 0.75;
    case LayoutState.desktop:
      return constraints.maxWidth * 0.65;
  }
}
