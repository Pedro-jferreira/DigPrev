import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/questionnaireViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/widgets/stagePageWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeRoute extends GoRoute {
  HomeRoute()
      : super(
    path: '/',
    pageBuilder: (context, state) =>  MaterialPage(
      child: StagePageWidget(viewModel: context.watch<QuestionnaireViewModel>()),
    ),
  );
}