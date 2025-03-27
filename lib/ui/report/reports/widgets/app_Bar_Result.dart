import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:digprev_flutter/utils/layoutUtils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AppBarResult extends StatelessWidget implements PreferredSizeWidget {
  const AppBarResult({
    required this.title,
    super.key,
  });

  final String title;

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
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
            icon: const Icon(Icons.share),
            color: Theme.of(context).colorScheme.primaryFixed,
            onPressed: () {},
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
