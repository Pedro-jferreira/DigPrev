import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:digprev_flutter/utils/layoutUtils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliverAppBarResult extends StatelessWidget {
  const SliverAppBarResult({
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
      stretch: true,
      stretchTriggerOffset: 300.0,
      onStretchTrigger: onStretchTrigger,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
      title: Title(context),
      actions: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: IconButton(
      icon: const Icon(Icons.share),
      color: Theme.of(context).colorScheme.primaryFixed, onPressed: () {  },),
    )
      ],
    );
  }

  Widget Title(BuildContext context) {
    return Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.primaryFixed),
        softWrap: true,
    );
  }
}