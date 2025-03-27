import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:digprev_flutter/utils/layoutUtils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.actions,
    super.key,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final LayoutState layout = determineLayoutState(context);
    final bool hasLeading =
    (layout == LayoutState.mobile || layout == LayoutState.smallTablet);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      surfaceTintColor:Theme.of(context).colorScheme.tertiary ,
      shadowColor: Theme.of(context).colorScheme.shadow,
      shape:  RoundedRectangleBorder(
        borderRadius:
        hasLeading ?
        const BorderRadius.vertical(bottom: Radius.circular(5))
            : const BorderRadius.all(Radius.circular(12))
      ),
      elevation: 5,
      leading: hasLeading
          ? IconButton(
        icon: const Icon(Icons.close),
        color: Theme.of(context).colorScheme.primaryFixed,
        onPressed: () => GoRouter.of(context).pop(),
      )
          : null,
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.primaryFixed),
        softWrap: true,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
