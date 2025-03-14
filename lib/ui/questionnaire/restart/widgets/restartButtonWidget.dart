import 'package:digprev_flutter/ui/questionnaire/restart/viewModels/restartViewModel.dart';
import 'package:flutter/material.dart';

class RestartButtonWidget extends StatefulWidget {
  const RestartButtonWidget({required this.viewModel,super.key});
  final RestartViewModel viewModel;

  @override
  State<RestartButtonWidget> createState() =>
      _RestartButtonWidgetState();
}

class _RestartButtonWidgetState extends State<RestartButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onPressed() {
    widget.viewModel.generateCardResponse.execute();
    if ( widget.viewModel.generateCardResponse.isRunning) {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onPressed,
      child: RotationTransition(
        turns: _controller.drive(Tween<double>(begin: 1.0, end: 0.0)),
        child: const Icon(Icons.replay),
      ),
    );
  }
}
