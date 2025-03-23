import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/stepper_Indicator.dart';
import 'package:digprev_flutter/utils/layoutUtils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarForm extends StatelessWidget implements PreferredSizeWidget {
  const AppBarForm({
    required this.sections,
    required this.currentStep,
    required this.totalSteps,
    required this.canMarkStepComplete,
    this.onStepTapped,
    this.stepper,
    super.key,
    this.onClose,
  });

  final List<Section> sections;
  final Widget? stepper;
  final VoidCallback? onClose;
  final int currentStep;
  final int totalSteps;
  final bool Function(int step) canMarkStepComplete;
  final ValueChanged<int>? onStepTapped;

  @override
  Widget build(BuildContext context) {
    final bool hasStepper = (sections.length > 1);
    final LayoutState layout = determineLayoutState(context);
    final bool hasLeading =
    (layout == LayoutState.mobile || layout == LayoutState.smallTablet);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          AppBar(

            automaticallyImplyLeading: false,

            leading: hasLeading
                ? IconButton(
              icon: const Icon(Icons.close),
              color: Theme.of(context).colorScheme.primaryFixed,
              onPressed: onClose ?? () => GoRouter.of(context).pop(),
            )
                : null,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            shadowColor: Theme.of(context).colorScheme.shadow,
            surfaceTintColor: Colors.transparent,
            title:FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                    sections[currentStep].title,
                    softWrap: true,
                    maxLines: 3,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryFixed,
                    ),
                  ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
          ),if(hasStepper)
          SizedBox(
            height: 72,
            child: FractionallySizedBox(
              widthFactor: sections.length == 2 ? 0.7 : 1.0,
              child: StepperIndicator(
                currentStep: currentStep.toInt(),
                totalSteps: totalSteps,
                canMarkStepComplete: canMarkStepComplete,
                onStepTapped: onStepTapped,
              ),
            ),
          ),

        ],
      ),
    );
  }
  @override
  Size get preferredSize {
    final bool hasStepper = (sections.length > 1);
    final double stepperHeight = hasStepper? 72.0: 0;
    return Size.fromHeight(kToolbarHeight + stepperHeight);
  }
}