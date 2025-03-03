import 'package:flutter/material.dart';

class StepperIndicatorWidget extends StatefulWidget {
  final int currentStep;
  final int totalSteps;
  final bool Function(int step) canMarkStepComplete;
  final ValueChanged<int>? onStepTapped;

  const StepperIndicatorWidget({
    required this.currentStep,
    required this.totalSteps,
    required this.canMarkStepComplete,
    this.onStepTapped,
    super.key,
  });

  @override
  State<StepperIndicatorWidget> createState() => _StepperIndicatorWidgetState();
}

class _StepperIndicatorWidgetState extends State<StepperIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Stepper(
      onStepTapped: widget.onStepTapped,
      key: ValueKey<int>(widget.totalSteps),
      currentStep: widget.currentStep,
      stepIconWidth: 30.0,
      stepIconHeight:30.0 ,
      elevation: 0,
      controlsBuilder:
          (BuildContext context, ControlsDetails details) =>
              const SizedBox.shrink(),
      type: StepperType.horizontal,
      steps: List<Step>.generate(
        widget.totalSteps,
        (int index) {
          final StepState state  = widget.canMarkStepComplete(index)
              ? StepState.complete
              : (index == widget.currentStep
              ? StepState.editing
              : StepState.indexed);
          return Step(
            title: const SizedBox.shrink(),
            content: const SizedBox.shrink(),
            isActive: index <= widget.currentStep,
            state: state
          );
        }),
    );
  }
}
