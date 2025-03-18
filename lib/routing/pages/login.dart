import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/start_auth/login/view_models/loginViewModel.dart';
import 'package:digprev_flutter/ui/start_auth/login/widgets/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginRoute extends GoRoute{
  LoginRoute()
      : super(
    name: AppRoutes.login.name,
    path: AppRoutes.login.path,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return MaterialPage<dynamic>(
        child: LoginScreen(loginViewModel: context.watch<LoginViewModel>()),
      );
    },
  );
}