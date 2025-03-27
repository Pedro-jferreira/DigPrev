import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:digprev_flutter/ui/shell/viewModels/shell_View_Model.dart';
import 'package:digprev_flutter/ui/shell/widgets/pageNavigation/usePageView.dart';
import 'package:digprev_flutter/utils/layoutUtils.dart';
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
      scrollDirection: viewModel.scrollDirection,
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
                final double contentWidth = calculateContentWidth(
                  constraints,
                  viewModel.layoutType,
                );
                if(viewModel.layoutType == LayoutState.desktop||
                    viewModel.layoutType == LayoutState.tablet){
                  return Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: contentWidth,
                                  maxHeight: constraints.maxHeight,
                                ),
                                child: widget,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TopBar(context),
                    ],
                  );
                }else{
                  return Column(
                    children: <Widget>[
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: contentWidth,
                          maxHeight: constraints.maxHeight,
                        ),
                        child: widget,
                      ),
                    ),
                  ),
                    ]);
                }

              },
            );
          }).toList(),
    );
  }
  Widget TopBar(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          viewModel.showLeading?
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => GoRouter.of(context).pop(),
            ):  const SizedBox(),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
