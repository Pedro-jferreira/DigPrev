import 'package:flutter/material.dart';

class InitialImage extends StatelessWidget {
  const InitialImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.darken,
        shaderCallback: (Rect rect) =>
            const RadialGradient(
                radius: 0.8,
                focalRadius: 5,
                colors: <Color>[
                  Colors.transparent,
                  Color(0xff022242)
                ]
            ).createShader(rect),
        child: Image.asset(
          'assets/images/front-view-girl-sitting-table.png',
          width: double.infinity,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
        )
    );
  }
}