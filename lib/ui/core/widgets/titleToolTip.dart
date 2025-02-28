
import 'package:digprev_flutter/ui/core/widgets/toolTipWidget.dart';
import 'package:flutter/material.dart';

class TitleToolTip extends StatelessWidget {
  final String title;
  final String tooltipText;

  const TitleToolTip({
    required this.title,
    required this.tooltipText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35, // Define uma altura mínima controlada
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ToolTipWidget(labelText: tooltipText),
        ],
      ),
    );
  }
}

