import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/data/repositories/stageRepository/stageRepositoryRemote.dart';
import 'package:digprev_flutter/data/services/fireStore/stageService.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersRemote {
  return <SingleChildWidget>[
    Provider(create: (context) => StageService()),
    Provider(
      create:
          (context) =>
              StageRepositoryRemote(stageServie: context.read())
                  as StageRepository,
    ),
  ];
}
