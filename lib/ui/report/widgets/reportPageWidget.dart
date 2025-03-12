import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/stageLabel.dart';
import 'package:digprev_flutter/ui/report/result/widgets/resultExpansionTile.dart';
import 'package:digprev_flutter/ui/report/widgets/resultIndicatorCardWidget.dart';
import 'package:flutter/material.dart';

class reportPageWidget extends StatelessWidget {
  const reportPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponseCard card = ResponseCard(
      id: '',
      userRef: '',
      date: DateTime.now(),
      sections: [],
      isCalculated: true,
      isCompleted: true,
    );
    final List<StageLabel> stages = <StageLabel>[
      const StageLabel(min: 0, max: 30, label: 'Baixo'),
      const StageLabel(min: 31, max: 60, label: 'Medio'),
      const StageLabel(min: 61, max: 100, label: 'Alto'),
      const StageLabel(min: 101, max: 150, label: 'Altissimo'),
    ];
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double availableHeight = constraints.maxHeight;
        return Column(
          children: <Widget>[
            SizedBox(
              child: Center(
                child: ResultIndicatorCardWidget(
                  title: 'Habitos de Vida',
                  tooltipText: 'gráfico',
                  maxValue: 150,
                  indicatorValue: 10,
                  stages: stages,
                ),
              ),
            ),
            SizedBox(
              child: Center(
                child: ResultExpansionTileWidget(responseCard: card, index: 1),
              ),
            ),
          ],
        );
      },
    );
  }
}
