import 'package:flutter/material.dart';

class InitialText extends StatelessWidget {
  final String titleText = 'DigPrev';
  final String subtitleText = 'Saúde Alimentar Digital';

  const InitialText({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            SizedBox(height: 15),
            Text(
              subtitleText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.tertiaryFixed,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
    );
  }
}
