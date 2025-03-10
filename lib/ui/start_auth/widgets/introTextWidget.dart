import 'package:flutter/material.dart';

class InitialText extends StatelessWidget {
  final String titleText = 'DigPrev';
  final String subtitleText = 'Saúde Alimentar Digital';

  const InitialText({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 45),
          child: Column(
            children: <Widget> [
              Text(
                titleText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.tertiaryFixed,
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 34),
              Text(
                subtitleText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.tertiaryFixed,
                  fontWeight: FontWeight.normal,
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
