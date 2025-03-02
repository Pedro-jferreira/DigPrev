import 'package:flutter/material.dart';

class ToolTipWidget extends StatelessWidget {
  final String labelText;
  const ToolTipWidget({
    required this.labelText,
    super.key,
  });

  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder:
              (BuildContext context) => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const Icon(
                  Icons.info_outline,
                  color: Colors.green,
                ),
                content: Text(
                  labelText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
        );
      },

      iconSize: 20,
      color: Theme.of(context).colorScheme.primary,
      icon: const Icon(Icons.info),
    );
  }
}
