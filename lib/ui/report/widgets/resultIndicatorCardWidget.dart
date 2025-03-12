import 'package:digprev_flutter/domain/models/section/stageLabel.dart';
import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';

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
    double hueStep = 25.0,
  }) {
    final HSLColor hslBase = HSLColor.fromColor(baseColor);
    final double baseHue = hslBase.hue;

    return List<Color>.generate(count, (int index) {
      final double newHue = (baseHue + (hueStep * (index + 1))) % 360;
      return hslBase.withHue(newHue).toColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Theme.of(context).colorScheme.primary;
    final List<Color> stageColors = _generateColorVariants(
      baseColor,
      stages.length,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TitleToolTip(title: title, tooltipText: tooltipText),
            CustomPaint(
              size: const Size(double.infinity, 30),
              painter: BarPainter(
                maxValue,
                indicatorValue,
                stages,
                stageColors,
                context,
              ),
            ),
            const SizedBox(height: 16),
            getSteps(stageColors, stages, context)
            // Adicionando a legenda
          ],
        ),
      ),
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
          children: <Widget>[
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: stageColors[index],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              stages[index].label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      );
    }),
  );
}

class BarPainter extends CustomPainter {
  final double maxValue;
  final double indicatorValue;
  final List<StageLabel> stages;
  final List<Color> stageColors;
  final BuildContext context;

  BarPainter(
    this.maxValue,
    this.indicatorValue,
    this.stages,
    this.stageColors,
    this.context,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final double barHeight = size.height / 2;
    double startX = 0;

    // Desenha os estágios coloridos
    for (int i = 0; i < stages.length; i++) {
      final StageLabel stage = stages[i];
      final double stageWidth = (stage.max - stage.min) / maxValue * size.width;
      final Paint stagePaint = Paint()..color = stageColors[i];

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(startX, size.height / 4, stageWidth, barHeight),
          const Radius.circular(10),
        ),
        stagePaint,
      );

      startX += stageWidth;
    }

    double indicatorX = (indicatorValue / maxValue) * size.width;
    indicatorX = indicatorX.clamp(0, size.width);

    final Paint indicatorPaint =
        Paint()..color = Theme.of(context).colorScheme.secondary;
    canvas.drawCircle(Offset(indicatorX, size.height / 2), 10, indicatorPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
