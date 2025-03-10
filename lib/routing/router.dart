import 'package:digprev_flutter/data/repositories/userRepository/authNotifier.dart';
import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/routing/pages/home.dart';
import 'package:digprev_flutter/routing/pages/login.dart';
import 'package:digprev_flutter/routing/pages/profile.dart';
import 'package:digprev_flutter/routing/pages/report.dart';
import 'package:digprev_flutter/routing/pages/start.dart';
import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/home/viewModels/homeViewModel.dart';
import 'package:digprev_flutter/ui/home/widgets/homePageWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:result_dart/result_dart.dart';
import 'package:digprev_flutter/ui/home/widgets/pageNavigation/navigatorContainerWithPageView.dart';
import 'package:provider/provider.dart';


GoRouter router({required AuthNotifier authNotifier}) {
  return GoRouter(
    initialLocation: AppRoutes.quiz.path,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final isAuthenticated = authNotifier.isAuthenticated;
      final isLoginRoute = state.matchedLocation == AppRoutes.login.path;

      if(!isAuthenticated){
        return AppRoutes.login.path;
      }
      if(isLoginRoute){
        return AppRoutes.quiz.path;
      }
      return null;
    },
    routes: <RouteBase>[
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
