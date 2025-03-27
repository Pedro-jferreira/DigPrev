import 'package:flutter/material.dart';
class SharedButton extends StatelessWidget {
  const SharedButton({super.key, required this.responseCardId, this.color});
  final String responseCardId;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.share),
    color: color ?? Theme.of(context).colorScheme.primary,
    onPressed: () {});
  }
}
