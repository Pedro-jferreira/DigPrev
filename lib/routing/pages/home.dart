import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/questionnaire/form/form_Screen.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/sectionViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/questionnaireViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/stage_Screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeRoute extends GoRoute {
  HomeRoute()
    : super(
        name: AppRoutes.quiz.name,
        path: AppRoutes.quiz.path,
        pageBuilder:
            (BuildContext context, GoRouterState state) =>
                MaterialPage<dynamic>(
                  child: StageScreen(
                    viewModel: context.watch<QuestionnaireViewModel>(),
                  ),
                ),
        routes: <RouteBase>[
          GoRoute(
            name: AppRoutes.section.name,
            path: AppRoutes.section.path,
            pageBuilder: (BuildContext context, GoRouterState state) {
              final String id = state.pathParameters['id']!;
              return MaterialPage<dynamic>(
                child: FormScreen(
                  stageId: id,
                  viewModel: context.watch<SectionViewModel>(),
                  formViewModel: context.watch<FormViewModel>(),
                ),
              );
            },
          ),
        ],
      );
}
