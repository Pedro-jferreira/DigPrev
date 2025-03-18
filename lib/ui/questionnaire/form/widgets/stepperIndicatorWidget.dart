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
    return Theme(
      data: ThemeData(
        canvasColor: Theme.of(context).colorScheme.tertiary,

        disabledColor: Colors.orange,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Theme.of(context).colorScheme.primary,
          secondary: Theme.of(context).colorScheme.secondary,

        ),
      ),
      child: Stepper(
        onStepTapped: widget.onStepTapped,
        key: ValueKey<int>(widget.totalSteps),
        currentStep: widget.currentStep,
        elevation: 0,
        controlsBuilder:
            (BuildContext context, ControlsDetails details) =>
                const SizedBox.shrink(),
        type: StepperType.horizontal,
        margin: EdgeInsets.zero,
        steps: List<Step>.generate(widget.totalSteps, (int index) {
          final StepState state =
              widget.canMarkStepComplete(index)
                  ? StepState.complete
                  : (index == widget.currentStep
                      ? StepState.editing
                      : StepState.indexed);
          Color? iconColor;
          Color? textColor;
          if (index > widget.currentStep) {
            iconColor = Theme.of(context).colorScheme.surface;
            textColor = Theme.of(context).colorScheme.onSurface;
          }

          return Step(
            title: const SizedBox.shrink(),
            content: const SizedBox.shrink(),
            isActive: index <= widget.currentStep,
            state: state,
            stepStyle: StepStyle(
              color: iconColor,
              indexStyle: TextStyle(color: textColor),
            ),
          );
        }),
      ),
    );
  }
}
