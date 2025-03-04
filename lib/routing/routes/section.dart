import 'package:digprev_flutter/ui/questionnaire/section/viewModels/sectionViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/section/widgets/sectionPageWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
class SectionRoute extends GoRoute {
  SectionRoute()
      : super(
    path: '/section/:id',
    pageBuilder: (context, state) {
      final id = state.pathParameters['id']!;
      return MaterialPage(
        child: SectionPageWidget(stageId: id, viewModel: context.watch<SectionViewModel>()),
      );
    },
  );
}