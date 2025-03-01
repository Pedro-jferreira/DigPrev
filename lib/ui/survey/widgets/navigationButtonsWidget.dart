import 'package:flutter/material.dart';

class NavigationButtonsWidget extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtonsWidget({
    required this.onPrevious,
    required this.onNext,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed:  onPrevious,
            child: const Text("← Voltar"),
          ),
          ElevatedButton(
            onPressed:  onNext,
            child: const Text("Próximo →"),
          ),
        ],
      ),
    );
  }
}
