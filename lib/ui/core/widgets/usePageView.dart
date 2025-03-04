import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

typedef UsePageViewReturn =
    ({PageController pageController, void Function(int) onPageChanged});

UsePageViewReturn usePageView(StatefulNavigationShell navigationShell) {
  final PageController pageController = usePageController();
  final ObjectRef<bool> isFirstBuild = useRef(true);
  final ObjectRef<bool> isAnimating = useRef(false);

  useEffect(() {
    if (isFirstBuild.value) {
      isFirstBuild.value = false;
      return;
    }

    if (navigationShell.currentIndex != pageController.page) {
      isAnimating.value = true;
      pageController
          .animateToPage(
            navigationShell.currentIndex,
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeInOut,
          )
          .then((_) => isAnimating.value = false);
    }
    return null;
  }, <Object?>[navigationShell.currentIndex]);
  final Null Function(dynamic index) onPageChanged = useCallback((
    dynamic index,
  ) {
    if (isAnimating.value) {
      return;
    }
    navigationShell.goBranch(index);
  });
  return useMemoized(
    () => (pageController: pageController, onPageChanged: onPageChanged),
  );
}
