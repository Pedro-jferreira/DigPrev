import 'package:digprev_flutter/data/repositories/userRepository/authNotifier.dart';
import 'package:digprev_flutter/routing/pages/home.dart';
import 'package:digprev_flutter/routing/pages/login.dart';
import 'package:digprev_flutter/routing/pages/profile.dart';
import 'package:digprev_flutter/routing/pages/report.dart';
import 'package:digprev_flutter/routing/pages/start.dart';
import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/shell/viewModels/shell_View_Model.dart';
import 'package:digprev_flutter/ui/shell/shell_Page.dart';
import 'package:digprev_flutter/ui/questionnaire/restart/viewModels/restartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:digprev_flutter/ui/shell/widgets/pageNavigation/navigatorContainerWithPageView.dart';
import 'package:provider/provider.dart';

GoRouter router({required AuthNotifier authNotifier}) {
  Future<String> getInitialRoute() async {
    final bool isAuthenticated = authNotifier.isAuthenticated;

    if (isAuthenticated) {
      return AppRoutes.quiz.path;
    } else {
      return AppRoutes.login.path;
    }
  }

  return GoRouter(
    initialLocation: '/quiz',
    refreshListenable: authNotifier,
    restorationScopeId: 'app',
    redirect: (BuildContext context, GoRouterState state) {
      final bool isAuthenticated = authNotifier.isAuthenticated;
      final bool isLoginRoute = state.matchedLocation == AppRoutes.login.path;
      final String currentRoute = state.matchedLocation;

      if (AppRoutes.requiredLogin(currentRoute) && !isAuthenticated) {
        return AppRoutes.login.path;
      }
      if (isLoginRoute && isAuthenticated) {
        return AppRoutes.quiz.path;
      }
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (BuildContext context, GoRouterState state) async {
          return await getInitialRoute();
        },
      ),
      StartRoute(),
      LoginRoute(),
      StatefulShellRoute(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell child,
            ) => HomePageWidget(
              child: child,
              viewModel: context.watch<HomeViewModel>(),
              restartViewModel: context.watch<RestartViewModel>(),
            ),
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
            viewModel: context.watch<HomeViewModel>(),
          );
        },
      ),
    ],
  );
}
