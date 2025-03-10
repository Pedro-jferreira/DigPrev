import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
