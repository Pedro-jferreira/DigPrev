import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepositoryRemote.dart';
import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/data/repositories/stageRepository/stageRepositoryRemote.dart';
import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/data/repositories/userRepository/authRepositoryRemote.dart';
import 'package:digprev_flutter/data/services/fireStore/authService.dart';
import 'package:digprev_flutter/data/services/fireStore/responseCardService.dart';
import 'package:digprev_flutter/data/services/fireStore/stageService.dart';
import 'package:digprev_flutter/domain/use_cases/responseCardGenerator/responseCardGenerator.dart';
import 'package:digprev_flutter/domain/use_cases/responseCardGenerator/responseCardGeneratorImpl.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/questionnaireViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/section/viewModels/sectionViewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersRemote {
  return <SingleChildWidget>[
    Provider(create: (context) => StageService()),
    Provider(create: (context) => ResponseCardService()),
    Provider(create: (context) => AuthService()),
    Provider(
      create:
          (context) =>
              StageRepositoryRemote(stageServie: context.read())
                  as StageRepository,
    ),
    Provider(
      create:
          (context) =>
              ResponseCardRepositoryRemote(responseCardService: context.read())
                  as ResponseCardRepository,
    ),
    Provider(
      create:
          (context) =>
              AuthRepositoryRemote(authService: context.read())
                  as AuthRepository,
    ),
    Provider(
      create:
          (context) =>
              ResponseCardGeneratorImpl(
                    stageRepository: context.read(),
                    responseCardRepository: context.read(),
                  )
                  as ResponseCardGenerator,
    ),
    ChangeNotifierProvider(
      create:
          (context) => QuestionnaireViewModel(stageRepository: context.read()),
    ),
    ChangeNotifierProvider(
      create: (context) => SectionViewModel(stageRepository: context.read()),
    ),
  ];
}
