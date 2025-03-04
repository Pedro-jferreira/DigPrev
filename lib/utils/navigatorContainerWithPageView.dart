import 'package:digprev_flutter/ui/core/widgets/usePageView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
class NavigatorContainerWithPageView extends HookWidget {
  const NavigatorContainerWithPageView({
    super.key,
    required this.navigationShell,
    required this.children,
  });
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {


    final String basePath = GoRouterState.of(context).matchedLocation;
    final bool isRouteBlocked = basePath.startsWith('/section/');

    final (:pageController, :onPageChanged) = usePageView(navigationShell);
    return PageView(
      controller: pageController,
      physics: isRouteBlocked
          ? const NeverScrollableScrollPhysics()
          : const ClampingScrollPhysics(),
      onPageChanged: onPageChanged,
      children: children,
    );
  }
}