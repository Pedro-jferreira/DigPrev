
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
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          ToolTipWidget(labelText: tooltipText),
        ],
      );
  }
}

