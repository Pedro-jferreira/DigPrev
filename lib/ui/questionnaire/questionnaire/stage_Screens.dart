import 'dart:async';

import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/core/states/progressState.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/questionnaireViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/responseCardViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/widgets/stage_Item.dart';
import 'package:digprev_flutter/ui/questionnaire/restart/viewModels/restartViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/restart/widgets/restartButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class StageScreen extends StatefulWidget {
  const StageScreen({
    required this.viewModel,
    required this.responseCardViewModel,
    required this.restartViewModel,
    super.key,
  });

  final QuestionnaireViewModel viewModel;
  final ResponseCardViewModel responseCardViewModel;
  final RestartViewModel restartViewModel;

  @override
  State<StageScreen> createState() => _StageScreenState();
}

class _StageScreenState extends State<StageScreen> {
  int _currentStageIndex = 0;
  List<Stage> _stages = <Stage>[];
  StreamSubscription<Result<ResponseCard>>? _subscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.init();
    widget.viewModel.addListener(_onStagesChanged);
    _subscription = widget.responseCardViewModel.observerPending();
    widget.restartViewModel.observerPending();
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onStagesChanged);
    _subscription?.cancel();
    super.dispose();
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
  Future<void> _refresh() async {
    await widget.viewModel.refresh();
    _currentStageIndex = 0;// Recarrega os dados do questionário
    setState(() {}); // Atualiza a tela
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.stages.isEmpty ||
        widget.responseCardViewModel.responseCard == null)
      return const Center(child: CircularProgressIndicator());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double availableHeight = constraints.maxHeight;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: availableHeight * 0.55,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: _stages.length,
                    itemBuilder: (BuildContext contex, int index) {
                      return StageItem(
                        stage: _stages[index],
                        isAvailable: (_currentStageIndex == index),
                        viewModel: widget.responseCardViewModel,
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
        ),
      ),

      floatingActionButton: RestartButton(viewModel: widget.restartViewModel,),
    );
  }
}