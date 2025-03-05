import 'package:digprev_flutter/routing/pages/home.dart';
import 'package:digprev_flutter/routing/pages/login.dart';
import 'package:digprev_flutter/routing/pages/profile.dart';
import 'package:digprev_flutter/routing/pages/report.dart';
import 'package:digprev_flutter/routing/pages/start.dart';
import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/utils/navigatorContainerWithPageView.dart';
import 'package:digprev_flutter/ui/home/widgets/homePageWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.start.path,
  routes: <RouteBase>[
    StartRoute(),
    LoginRoute(),
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
