import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/core/enum/progressState.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/widgets/stageWidget.dart';
import 'package:flutter/material.dart';

class StagePageWidget extends StatefulWidget {
  final List<Stage> stages;

  const StagePageWidget({required this.stages, super.key});

  @override
  State<StagePageWidget> createState() => _StagePageWidgetState();
}

class _StagePageWidgetState extends State<StagePageWidget> {
  int _currentStageIndex = 0;

  void _onProgressStateChanged(int index, ProgressState state) {
    if (state == ProgressState.Complete && index == _currentStageIndex) {
      setState(() {
        if (index + 1 < widget.stages.length) {
          _currentStageIndex = index + 1; // Libera o próximo estágio
        } else {
          _currentStageIndex = -1; // Todos completos, bloqueia todos
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double availableHeight = constraints.maxHeight;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: availableHeight * 0.7,
              width: double.infinity,
              child: ListView.builder(
                itemCount: widget.stages.length,
                itemBuilder: (BuildContext contex, int index) {
                  return Stagewidget(
                    isAvailable: _currentStageIndex == index,
                    stage: widget.stages[index],
                    onProgressStateChanged: (ProgressState state) {
                      _onProgressStateChanged(index, state);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
