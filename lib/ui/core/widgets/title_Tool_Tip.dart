
import 'package:digprev_flutter/ui/core/widgets/tool_Tip_Button.dart';
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                softWrap: true, // Permite a quebra de linha
              ),
          ),

        ),
    ToolTipButton(labelText: tooltipText),

      ],
    );
  }
}

