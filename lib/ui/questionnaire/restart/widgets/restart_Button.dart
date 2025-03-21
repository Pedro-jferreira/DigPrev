import 'package:digprev_flutter/ui/questionnaire/restart/viewModels/restartViewModel.dart';
import 'package:flutter/material.dart';

class RestartButton extends StatefulWidget {
  const RestartButton({required this.viewModel,super.key});
  final RestartViewModel viewModel;

  @override
  State<RestartButton> createState() =>
      _RestartButtonState();
}

class _RestartButtonState extends State<RestartButton>
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
    _controller.dispose(); // Corrigido: Liberando recursos da animação
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
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      foregroundColor: Theme.of(context).colorScheme.primaryFixed,
    );
  }
}
