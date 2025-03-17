import 'package:flutter/material.dart';

class ToolTipButtonWidget extends StatelessWidget {
  final String labelText;

  const ToolTipButtonWidget({
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

    return Tooltip(
      key: tooltipKey,
      message: labelText,
      textStyle: TextStyle(color: Theme.of(context).colorScheme.primaryFixed),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          tooltipKey.currentState?.ensureTooltipVisible();
        },
        iconSize: 20,
        color: Theme.of(context).colorScheme.primary,
        icon: const Icon(Icons.info),
      ),
    );
  }
}
