import 'package:digprev_flutter/domain/models/section/stageLabel.dart';
import 'package:digprev_flutter/ui/core/widgets/title_Tool_Tip.dart';
import 'package:flutter/material.dart';
import 'package:segmented_progress_bar/segmented_progress_bar.dart';

class ResultIndicatorCardWidget extends StatelessWidget {
  final double maxValue;
  final double indicatorValue;
  final List<StageLabel> stages;
  final String title;
  final String tooltipText;

  const ResultIndicatorCardWidget({
    required this.maxValue,
    required this.indicatorValue,
    required this.stages,
    required this.tooltipText,
    required this.title,
    super.key,
  });

  List<Color> _generateColorVariants(
    Color baseColor,
    int count, {
    double hueStep = 40.0,
  }) {
    final HSLColor hslBase = HSLColor.fromColor(baseColor);
    final double baseHue = hslBase.hue;

    return List<Color>.generate(count, (int index) {
      final double newHue = (baseHue + (hueStep * (index + 1))) % 360;
      return hslBase.withHue(newHue).toColor();
    });
  }

  List<ProgressSegment> dynamicSegments(BuildContext context ,Color baseColor) {
    final List<Color> stageColors = _generateColorVariants(
      baseColor,
      stages.length,
    );

    return List<ProgressSegment>.generate(stages.length, (int index) {
      final StageLabel stage = stages[index];

      // Calcula o tamanho do segmento proporcional ao maxValue
      final double stageSize = (stage.max - stage.min) / maxValue * 100;

      return ProgressSegment(
        value: stageSize, // Tamanho proporcional
        color: stageColors[index], // Cor gerada automaticamente
        label: '', // Pode ser ajustado se precisar de um nome
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Theme.of(context).colorScheme.onPrimary;
    final List<Color> stageColors = _generateColorVariants(
      baseColor,
      stages.length,
    );
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TitleToolTip(title: title, tooltipText: tooltipText),
            const SizedBox(height: 16),
            _buildChart(baseColor),
            const SizedBox(height: 16),
            getSteps(stageColors, stages, context),
          ],
        ),
      ),
    );
  }
  Widget _buildChart(Color baseColor ){
   return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double indicatorPosition =
            (indicatorValue / maxValue) * constraints.maxWidth;

        // Verificações de limites
        if (indicatorValue < 0) {
          indicatorPosition = 0;
        } else if (indicatorValue >= maxValue) {
          indicatorPosition = constraints.maxWidth - 15;
        }
        return Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            SegmentedProgressBar(segments: dynamicSegments(context,baseColor )),
            Positioned(
              left: indicatorPosition ,
              child: Container(
                width: 15,
                height: 15,
                decoration:  BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget getSteps(
  List<Color> stageColors,
  List<StageLabel> stages,
  BuildContext context,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List<Widget>.generate(stages.length, (int index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: stageColors[index],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                stages[index].label,
                style: Theme.of(context).textTheme.titleMedium,
                softWrap: true,
                maxLines: 2,

              ),
            ),
          ],
        ),
      );
    }),
  );
}