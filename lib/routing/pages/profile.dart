import 'package:digprev_flutter/ui/core/widgets/dummy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileRoute extends GoRoute {
  ProfileRoute()
    : super(
        path: '/profile',
        pageBuilder:
            (BuildContext context, GoRouterState state) =>
                const MaterialPage<dynamic>(child: Dummy(title: 'profile')),
      );
}
