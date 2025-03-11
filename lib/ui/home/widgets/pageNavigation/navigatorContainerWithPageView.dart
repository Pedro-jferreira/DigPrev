import 'package:digprev_flutter/ui/core/enum/homeLayoutState.dart';
import 'package:digprev_flutter/ui/home/viewModels/homeViewModel.dart';
import 'package:digprev_flutter/ui/home/widgets/pageNavigation/usePageView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class NavigatorContainerWithPageView extends HookWidget {
  const NavigatorContainerWithPageView({
    required this.navigationShell,
    required this.children,
    required this.viewModel,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final (
      :PageController pageController,
      :void Function(int p1) onPageChanged,
    ) = usePageView(navigationShell);

    return PageView(
      controller: pageController,
      physics:
          viewModel.isScrollable
              ? const ClampingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
      onPageChanged: onPageChanged,
      children:
          children.map((Widget widget) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double contentWidth;
                switch (viewModel.layoutType) {
                  case HomeLayoutState.mobile:
                    contentWidth = constraints.maxWidth; // Ocupa toda a largura
                    break;
                  case HomeLayoutState.smallTablet:
                    contentWidth = constraints.maxWidth * 0.85;
                    break;
                  case HomeLayoutState.tablet:
                    contentWidth = constraints.maxWidth * 0.75;
                    break;
                  case HomeLayoutState.desktop:
                    contentWidth = constraints.maxWidth * 0.70;
                    break;
                }

                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: contentWidth,
                      maxHeight: constraints.maxHeight, // Ocupa a altura total
                    ),
                    child: widget,
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
