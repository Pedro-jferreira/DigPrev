import 'package:digprev_flutter/utils/navigatorContainerWithPageView.dart';
import 'package:digprev_flutter/routing/routes/home.dart';
import 'package:digprev_flutter/routing/routes/report.dart';
import 'package:digprev_flutter/routing/routes/profile.dart';
import 'package:digprev_flutter/ui/home/widgets/homePageWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    StatefulShellRoute(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell child,
          ) => HomePageWidget(child: child),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: <RouteBase>[HomeRoute()]),
        StatefulShellBranch(routes: <RouteBase>[PostsRoute()]),
        StatefulShellBranch(routes: <RouteBase>[ProfileRoute()]),
      ],
      navigatorContainerBuilder: (
        BuildContext context,
        StatefulNavigationShell navigationShell,
        List<Widget> children,
      ) {
        return NavigatorContainerWithPageView(
          navigationShell: navigationShell,
          children: children,
        );
      },
    ),
  ],
);
