import 'package:flutter/material.dart';

class RestartButtonWidget extends StatefulWidget {
  const RestartButtonWidget({super.key});

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
    _controller.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onPressed,
      child: RotationTransition(
        turns: _controller.drive(Tween(begin: 1.0, end: 0.0)),
        child: const Icon(Icons.replay),
      ),
    );
  }
}
