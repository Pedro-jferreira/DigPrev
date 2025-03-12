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
import 'package:digprev_flutter/domain/use_cases/responseCardGenerator/responseCardGenerator.dart';
import 'package:digprev_flutter/domain/use_cases/responseCardGenerator/responseCardGeneratorImpl.dart';
import 'package:digprev_flutter/ui/home/viewModels/homeViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/question/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/questionnaireViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/section/viewModels/sectionViewModel.dart';
import 'package:digprev_flutter/ui/start_auth/view_models/loginViewModel.dart';
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
    ChangeNotifierProvider<QuestionnaireViewModel>(
      create:
          (BuildContext context) =>
              QuestionnaireViewModel(stageRepository: context.read()),
    ),
    ChangeNotifierProvider<SectionViewModel>(
      create:
          (BuildContext context) =>
              SectionViewModel(stageRepository: context.read()),
    ),
    ChangeNotifierProvider<LoginViewModel>(
      create:
          (BuildContext context) =>
              LoginViewModel(authRepository: context.read()),
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
  ];
}
