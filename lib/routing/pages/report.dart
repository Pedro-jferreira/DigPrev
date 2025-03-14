import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/report/widgets/reportPageWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostsRoute extends GoRoute {
  PostsRoute()
    : super(
    name: AppRoutes.report.name,
        path: AppRoutes.report.path,
        pageBuilder:
            (BuildContext context, GoRouterState state) =>
                const MaterialPage<dynamic>(child: reportPageWidget()),
      );
}
