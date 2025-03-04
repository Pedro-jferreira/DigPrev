import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/core/enum/progressState.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/questionnaireViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/widgets/stageWidget.dart';
import 'package:flutter/material.dart';

class StagePageWidget extends StatefulWidget {
  const StagePageWidget({required this.viewModel, super.key});

  final QuestionnaireViewModel viewModel;
  @override
  State<StagePageWidget> createState() => _StagePageWidgetState();
}

class _StagePageWidgetState extends State<StagePageWidget> {
  int _currentStageIndex = 0;
  List<Stage> _stages = <Stage>[];
  @override
  void initState() {
    super.initState();
    widget.viewModel.init();
    widget.viewModel.addListener(_onStagesChanged);
  }
  @override
  void dispose() {
    super.dispose();
    widget.viewModel.removeListener(_onStagesChanged);
  }
  void _onStagesChanged() {
    setState(() {
      _stages = widget.viewModel.stages;
    });
  }


  void _onProgressStateChanged(int index, ProgressState state) {
    if (state == ProgressState.Complete && index == _currentStageIndex) {
      setState(() {
        if (index + 1 < _stages.length) {
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
                itemCount: _stages.length,
                itemBuilder: (BuildContext contex, int index) {
                  return Stagewidget(
                    isAvailable: _currentStageIndex == index,
                    stage: _stages[index],
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
