import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/start_auth/start/view_models/startViewModel.dart';
import 'package:digprev_flutter/ui/start_auth/start/widgets/startScreen.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartRoute extends GoRoute{
  StartRoute()
      : super(
    name: AppRoutes.start.name,
    path: AppRoutes.start.path,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return MaterialPage<dynamic>(
        child: ChangeNotifierProvider<StartViewModel>(
          create: (_) => StartViewModel(),
          child: const StartScreen(),
        ),
      );
    },
  );
}