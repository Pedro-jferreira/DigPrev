import 'package:flutter/material.dart';

class InitialImage extends StatelessWidget {
  const InitialImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'lib/assets/images/front-view-girl-sitting-table.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withBlue(5), // Sombra no topo
                Colors.black.withAlpha(5),           // Centro transparente
                Colors.black.withBlue(5), // Sombra embaixo
              ],
            ),
          ),
        ),
      ],
    );

  }
}
