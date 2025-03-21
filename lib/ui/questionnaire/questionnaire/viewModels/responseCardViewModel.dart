import 'dart:async';

import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class ResponseCardViewModel extends ChangeNotifier {
  ResponseCardViewModel({required ResponseCardRepository repository})
    : _repository = repository;
  final ResponseCardRepository _repository;

  ResponseCard? _responseCard;

  ResponseCard? get responseCard => _responseCard;

  StreamSubscription<Result<ResponseCard>> observerPending() {
    return _repository.observerPending().listen((Result<ResponseCard> onData) {
      _responseCard = onData.fold(
        (ResponseCard onSuccess) => onSuccess,
        (Exception onFailure) => null,
      );
      notifyListeners();
    });
  }

  double getProgress(List<Section> sections) {
    if (_responseCard != null) {
      final List<SectionAnswer> sectionsAnswers = <SectionAnswer>[];
      for (Section section in sections) {
        for (SectionAnswer answer in _responseCard!.sections) {
          if (answer.subSectionsAnswers != null) {
            for (SectionAnswer subAnswer in answer.subSectionsAnswers!) {
              if (subAnswer.sectionRef == section.id)
                sectionsAnswers.add(subAnswer);
            }
          }
          if (answer.sectionRef == section.id) sectionsAnswers.add(answer);
        }
      }
      final List<Answer> allAnswers = <Answer>[];
      for (SectionAnswer sectionAnswer in sectionsAnswers) {
        if (sectionAnswer.answers.isNotEmpty)
          allAnswers.addAll(sectionAnswer.answers);
      }
      if (allAnswers.isEmpty) return 0.0;

      final int filledAnswers =
          allAnswers.where((Answer a) => a.answers.isNotEmpty).length;

      return filledAnswers / allAnswers.length;
    }

    return 0.0;
  }


}
