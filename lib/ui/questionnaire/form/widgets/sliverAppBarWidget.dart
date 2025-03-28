import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:digprev_flutter/utils/layoutUtils.dart';
import 'package:digprev_flutter/utils/helpers/sliverAppBarHelper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    required this.title,
    super.key,
    this.onStretchTrigger,
  });
  final String title;
  final Future<void> Function()? onStretchTrigger;

  @override
  Widget build(BuildContext context) {
    final LayoutState layout = determineLayoutState(context);
    final bool hasLeading =
        (layout == LayoutState.mobile || layout == LayoutState.smallTablet);
    final (
      double? collapsedHeight,
      double expandedHeight,
    ) = SliverAppBarHelper.calculateAppBarHeights(title, hasLeading);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      leading:
          hasLeading
              ? IconButton(
                icon: const Icon(Icons.close),
                color: Theme.of(context).colorScheme.primaryFixed,
                onPressed: () => GoRouter.of(context).pop(),
              )
              : null,
      shadowColor: Theme.of(context).colorScheme.shadow,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      surfaceTintColor: Colors.transparent,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      stretch: true,
      stretchTriggerOffset: 300.0,
      onStretchTrigger: onStretchTrigger,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      flexibleSpace:
          hasLeading
              ? Title(context)
              : Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Title(context),
              ),
    );
  }

  Widget Title(BuildContext context) {
    return FlexibleSpaceBar(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.primaryFixed),
        softWrap: true,
      ),
    );
  }
}
