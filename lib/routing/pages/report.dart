import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/report/reports/report_Screen.dart';
import 'package:digprev_flutter/ui/report/reports/viewModels/Report_VielModel.dart';
import 'package:digprev_flutter/ui/report/result/resultPageWidget.dart';
import 'package:digprev_flutter/ui/report/result/viewModels/result_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PostsRoute extends GoRoute {
  PostsRoute()
    : super(
    name: AppRoutes.report.name,
        path: AppRoutes.report.path,
        pageBuilder:
            (BuildContext context, GoRouterState state) =>
                MaterialPage<dynamic>(child: ResultPageWidget(viewModel:
                context.watch<ResultViewModel>())),
    routes: <RouteBase>[
      GoRoute(name: AppRoutes.resultChart.name,
      path:AppRoutes.resultChart.path,
      pageBuilder:  (BuildContext context, GoRouterState state) {
        final String id = state.pathParameters['id']!;
        return MaterialPage<dynamic>(
          child: reportPageWidget(id: id, viewModel: context.watch<ReportViewModel>(),),
        );
      })
    ]
      );
}
