import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/core/widgets/dummy.dart';
import 'package:digprev_flutter/ui/users/users/view_models/usersViewModel.dart';
import 'package:digprev_flutter/ui/users/users/widgets/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileRoute extends GoRoute {
  ProfileRoute() : super(
    name: AppRoutes.profile.name,
    path: AppRoutes.profile.path,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        MaterialPage<dynamic>(
            child:
            UserScreen(usersViewModel: context.watch<UsersViewModel>())
        ),
  );
}
