import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExplanatoryTextWidget extends StatefulWidget {
  final String labelText;
  final List<String> explanatoryText;

  const ExplanatoryTextWidget({
    required this.labelText,
    required this.explanatoryText,
    Key? key,
  });

  @override
  _ExplanatoryTextWidgetState createState() => _ExplanatoryTextWidgetState();
}

class _ExplanatoryTextWidgetState extends State<ExplanatoryTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.labelText,
          selectionColor: Theme.of(context).colorScheme.onSurface,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 8),
        ...widget.explanatoryText.asMap().entries.map((
          MapEntry<int, String> entry,
        ) {
          final int index = entry.key + 1;
          final String text = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '$index - $text',
              selectionColor: Theme.of(context).colorScheme.outline,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }).toList(),
      ],
    );
  }
}
