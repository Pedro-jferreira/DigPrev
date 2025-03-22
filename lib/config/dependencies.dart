import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepositoryRemote.dart';
import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/data/repositories/stageRepository/stageRepositoryRemote.dart';
import 'package:digprev_flutter/data/repositories/userRepository/authNotifier.dart';
import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/data/repositories/userRepository/authRepositoryRemote.dart';
import 'package:digprev_flutter/data/services/fireStore/authService.dart';
import 'package:digprev_flutter/data/services/fireStore/responseCardService.dart';
import 'package:digprev_flutter/data/services/fireStore/stageService.dart';
import 'package:digprev_flutter/domain/useCases/answer_progress/answer_progress.dart';
import 'package:digprev_flutter/domain/useCases/answer_progress/answer_progress_impl.dart';
import 'package:digprev_flutter/domain/useCases/responseCardGenerator/responseCardGenerator.dart';
import 'package:digprev_flutter/domain/useCases/responseCardGenerator/responseCardGeneratorImpl.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/sectionViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/responseCardViewModel.dart';
import 'package:digprev_flutter/ui/report/reports/viewModels/Report_ViewModel.dart';
import 'package:digprev_flutter/ui/report/result/viewModels/result_ViewModel.dart';
import 'package:digprev_flutter/ui/shell/viewModels/shell_View_Model.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/questionnaireViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/restart/viewModels/restartViewModel.dart';
import 'package:digprev_flutter/ui/start_auth/login/view_models/loginViewModel.dart';
import 'package:digprev_flutter/ui/users/users/view_models/usersViewModel.dart';
import 'package:digprev_flutter/utils/update/viewModel.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersRemote {
  return <SingleChildWidget>[
    Provider<StageService>(create: (BuildContext context) => StageService()),
    Provider<ResponseCardService>(
      create: (BuildContext context) => ResponseCardService(),
    ),
    Provider<AuthService>(create: (BuildContext context) => AuthService()),
    Provider<StageRepository>(
      create:
          (BuildContext context) =>
              StageRepositoryRemote(stageServie: context.read())
                  as StageRepository,
    ),
    Provider<ResponseCardRepository>(
      create:
          (BuildContext context) =>
              ResponseCardRepositoryRemote(responseCardService: context.read())
                  as ResponseCardRepository,
    ),
    Provider<AuthRepository>(
      create:
          (BuildContext context) =>
              AuthRepositoryRemote(authService: context.read())
                  as AuthRepository,
    ),
    Provider<ResponseCardGenerator>(
      create:
          (BuildContext context) =>
              ResponseCardGeneratorImpl(
                    stageRepository: context.read(),
                    responseCardRepository: context.read(),
                  )
                  as ResponseCardGenerator,
    ),
    Provider<AnswerProgress>(
      create:
          (BuildContext context) =>
          AnswerProgressImpl(
      )
      as AnswerProgress,
    ),
    ChangeNotifierProvider<QuestionnaireViewModel>(
      create:
          (BuildContext context) =>
              QuestionnaireViewModel(stageRepository: context.read()),
    ),

    ChangeNotifierProvider<ResponseCardViewModel>(
      create:
          (BuildContext context) =>
              ResponseCardViewModel(repository: context.read(),
              answerProgress:  context.read()),
    ),
    ChangeNotifierProvider<SectionViewModel>(
      create:
          (BuildContext context) =>
              SectionViewModel(stageRepository: context.read(),
              answerProgress:  context.read()),
    ),
    ChangeNotifierProvider<LoginViewModel>(
      create:
          (BuildContext context) =>
              LoginViewModel(authRepository: context.read()),
    ),
    ChangeNotifierProvider<UsersViewModel>(
      create:
          (BuildContext context) =>
              UsersViewModel(authRepository: context.read()),
    ),
    ChangeNotifierProvider<FormViewModel>(
      create:
          (BuildContext context) => FormViewModel(repository: context.read()),
    ),
    ChangeNotifierProvider<AuthNotifier>(
      create:
          (BuildContext context) =>
              AuthNotifier(authRepository: context.read()),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) => HomeViewModel(),
    ),
    ChangeNotifierProvider<RestartViewModel>(
      create:
          (BuildContext context) => RestartViewModel(
            cardGenerator: context.read(),
            repository: context.read(),
          ),
    ),
    ChangeNotifierProvider<ResultViewModel>(
      create:
          (BuildContext context) => ResultViewModel(repository: context.read()),
    ),
    ChangeNotifierProvider<ReportViewModel>(
      create:
          (BuildContext context) => ReportViewModel(
            responseCardRepository: context.read(),
            stageRepository: context.read(),
          ),
    ),
    ChangeNotifierProvider<ViewModel>(
      create:
          (BuildContext context) => ViewModel(stageRepository: context.read()),
    ),
  ];
}
