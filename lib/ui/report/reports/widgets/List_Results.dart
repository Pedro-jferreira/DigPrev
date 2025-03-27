import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/ui/report/reports/widgets/resultIndicatorCardWidget.dart';
import 'package:flutter/material.dart';


class ListViewResults extends StatelessWidget {
  const ListViewResults({required this.sectionAnswers, super.key});

  final Map<Section, SectionAnswer> sectionAnswers;

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<Section, SectionAnswer>> entries =
    sectionAnswers.entries.toList();

    return ListView.builder(
      itemCount: sectionAnswers.length,
      itemBuilder: (BuildContext context, int index) {
        final Section section = entries[index].key;
        final SectionAnswer answer = entries[index].value;
        return ResultIndicatorCardWidget(
          textUnderBar: section.textUnderBar!,
          maxValue: section.maxValue,
          indicatorValue: answer.score,
          tooltipText: section.tooltipText,
          title: answer.title,
        );
      },
    );
  }
}

