import 'dart:async';

import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/core/states/progressState.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/questionnaireViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/responseCardViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/widgets/stage_Item.dart';
import 'package:digprev_flutter/ui/questionnaire/restart/viewModels/restartViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/restart/widgets/restart_Button.dart';
import 'package:flutter/material.dart';

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
  List<Stage> _stages = <Stage>[];
  int _currentStageIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.viewModel.init();
    widget.viewModel.addListener(_onStagesChanged);
    widget.responseCardViewModel.observerPending();
    widget.restartViewModel.observerPending();
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onStagesChanged);
    super.dispose();
  }

  void _onStagesChanged() {
    setState(() {
      _stages = widget.viewModel.stages;
    });
  }

  void _onProgressStateChanged(int index, ProgressState state) {
    setState(() {
      // Se o usuário completou o estágio atual, avança
      if (state == ProgressState.Complete && index == _currentStageIndex) {
        if (index + 1 < _stages.length) {
          _currentStageIndex = index + 1;
        } else {
          // Chegou no final
          _currentStageIndex = -1;
        }
      }
      // Se o usuário regrediu o estágio atual, reavalia onde ele está
      else if (state == ProgressState.Running) {
        _currentStageIndex = index;
      }
    });
  }

  Future<void> _refresh() async {
    await widget.viewModel.refresh();
    _currentStageIndex = 0;

    setState(() {}); // Atualiza a tela
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_currentStageIndex == -1 &&
          ModalRoute.of(context)?.isCurrent == true) {
        widget.responseCardViewModel.setComplete();
      }
    });
    if (widget.viewModel.stages.isEmpty)
      return const Center(child: CircularProgressIndicator());
    if (widget.responseCardViewModel.responseCard == null) {
      _currentStageIndex = 0;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Sem Questionários Pendentes,'
                    ' clique no botão abaixo para Começar',
              ),
            ),
            const SizedBox(height: 40),
            RestartButton(
              viewModel: widget.restartViewModel,
              refresh: _refresh,
            ),
          ],
        ),
      );
    }
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
                  height: availableHeight * 0.5,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _stages.length,
                    itemBuilder: (BuildContext context, int index) {
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
    );
  }
}
