import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/ui/report/reports/widgets/resultIndicatorCardWidget.dart';
import 'package:flutter/material.dart';

class SliverListResults extends StatelessWidget {
  const SliverListResults({required this.sectionAnswers, super.key});

  final Map<Section, SectionAnswer> sectionAnswers;

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<Section, SectionAnswer>> entries =
        sectionAnswers.entries.toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final Section section = entries[index].key;
        final SectionAnswer answer = entries[index].value;
        return ResultIndicatorCardWidget(
          maxValue: section.maxValue,
          indicatorValue: answer.score,
          stages: section.textUnderBar!,
          tooltipText: '',
          title: answer.title,
        );
      }, childCount: sectionAnswers.length),
    );
  }
}
