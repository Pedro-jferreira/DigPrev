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
        children: <Widget>[
          FilledButton.icon(
            onPressed: onPrevious,
            icon: const Icon(Icons.arrow_back), // Ícone de seta para a esquerda
            label: const Text('Voltar'),
          ),
          FilledButton.icon(
            onPressed: onNext,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Próximo'),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}
