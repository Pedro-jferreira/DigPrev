import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1351b4),
      surfaceTint: Color(0xff225abd),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff003a8c),
      onPrimaryContainer: Color(0xffb8cbff),
      secondary: Color(0xff168821),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff006c13),
      onSecondaryContainer: Color(0xfffdfff6),
      tertiary: Color(0xff071d41),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff000414),
      onTertiaryContainer: Color(0xff7486af),
      error: Color(0xffb00020),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff840015),
      onErrorContainer: Color(0xffffbbb8),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff191b22),
      onSurfaceVariant: Color(0xff434653),
      outline: Color(0xff737784),
      outlineVariant: Color(0xffc3c6d5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3037),
      inversePrimary: Color(0xffb0c6ff),
      primaryFixed: Color(0xffffffff),
      onPrimaryFixed: Color(0xff001945),
      primaryFixedDim: Color(0xffb0c6ff),
      onPrimaryFixedVariant: Color(0xff00429c),
      secondaryFixed: Color(0xff8ffb85),
      onSecondaryFixed: Color(0xff002202),
      secondaryFixedDim: Color(0xff73dd6b),
      onSecondaryFixedVariant: Color(0xff00530c),
      tertiaryFixed: Color(0xffd8e2ff),
      onTertiaryFixed: Color(0xff041a3e),
      tertiaryFixedDim: Color(0xffb4c6f3),
      onTertiaryFixedVariant: Color(0xff34466c),
      surfaceDim: Color(0xffd9d9e2),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3fc),
      surfaceContainer: Color(0xffededf6),
      surfaceContainerHigh: Color(0xffe7e7f0),
      surfaceContainerHighest: Color(0xffe2e2eb),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00327a),
      surfaceTint: Color(0xff225abd),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1351b4),
      onPrimaryContainer: Color(0xfffcfaff),
      secondary: Color(0xff004007),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff017f18),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000414),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff071d41),
      onTertiaryContainer: Color(0xff97a9d5),
      error: Color(0xff730011),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffb00020),
      onErrorContainer: Color(0xfffffaf9),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff0f1117),
      onSurfaceVariant: Color(0xff323641),
      outline: Color(0xff4e525f),
      outlineVariant: Color(0xff696d7a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3037),
      inversePrimary: Color(0xffb0c6ff),
      primaryFixed: Color(0xff3669cd),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff104fb2),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff017f18),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff006310),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5b6d95),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff42547b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5c6ce),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3fc),
      surfaceContainer: Color(0xffe7e7f0),
      surfaceContainerHigh: Color(0xffdcdce5),
      surfaceContainerHighest: Color(0xffd1d1da),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002966),
      surfaceTint: Color(0xff225abd),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0044a0),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003505),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff00560d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000414),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff071d41),
      onTertiaryContainer: Color(0xffc1d3ff),
      error: Color(0xff60000d),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff97001a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff282c37),
      outlineVariant: Color(0xff454955),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3037),
      inversePrimary: Color(0xffb0c6ff),
      primaryFixed: Color(0xff0044a0),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002f73),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff00560d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003c06),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff37496f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1f3257),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb8b8c1),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f0f9),
      surfaceContainer: Color(0xffe2e2eb),
      surfaceContainerHigh: Color(0xffd3d4dc),
      surfaceContainerHighest: Color(0xffc5c6ce),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff1351b4),
      surfaceTint: Color(0xffb0c6ff),
      onPrimary: Color(0xff002d6f),
      primaryContainer: Color(0xffb0c6ff),
      onPrimaryContainer: Color(0xffb8cbff),
      secondary: Color(0xff168821),
      onSecondary: Color(0xff003a06),
      secondaryContainer: Color(0xff73dd6b),
      onSecondaryContainer: Color(0xfffdfff6),
      tertiary: Color(0xff071d41),
      onTertiary: Color(0xff1d3054),
      tertiaryContainer: Color(0xffb4c6f3),
      onTertiaryContainer: Color(0xff7486af),
      error: Color(0xffb00020),
      onError: Color(0xff68000f),
      errorContainer: Color(0xffffb3af),
      onErrorContainer: Color(0xffffbbb8),
      surface: Color(0xff111319),
      onSurface: Color(0xffe2e2eb),
      onSurfaceVariant: Color(0xffc3c6d5),
      outline: Color(0xff8d909e),
      outlineVariant: Color(0xff434653),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2eb),
      inversePrimary: Color(0xff225abd),
      primaryFixed: Color(0xffffffff),
      onPrimaryFixed: Color(0xff001945),
      primaryFixedDim: Color(0xffb0c6ff),
      onPrimaryFixedVariant: Color(0xff00429c),
      secondaryFixed: Color(0xff8ffb85),
      onSecondaryFixed: Color(0xff002202),
      secondaryFixedDim: Color(0xff73dd6b),
      onSecondaryFixedVariant: Color(0xff00530c),
      tertiaryFixed: Color(0xffd8e2ff),
      onTertiaryFixed: Color(0xff041a3e),
      tertiaryFixedDim: Color(0xffb4c6f3),
      onTertiaryFixedVariant: Color(0xff34466c),
      surfaceDim: Color(0xff111319),
      surfaceBright: Color(0xff373940),
      surfaceContainerLowest: Color(0xff0c0e14),
      surfaceContainerLow: Color(0xff191b22),
      surfaceContainer: Color(0xff1d1f26),
      surfaceContainerHigh: Color(0xff282a30),
      surfaceContainerHighest: Color(0xff33353b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd0dcff),
      surfaceTint: Color(0xffb0c6ff),
      onPrimary: Color(0xff002359),
      primaryContainer: Color(0xff5f8ef3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff89f47f),
      onSecondary: Color(0xff002d04),
      secondaryContainer: Color(0xff3ba53b),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffcfdcff),
      onTertiary: Color(0xff102549),
      tertiaryContainer: Color(0xff7e90bb),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cf),
      onError: Color(0xff54000a),
      errorContainer: Color(0xffff5357),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111319),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd9dceb),
      outline: Color(0xffaeb1c0),
      outlineVariant: Color(0xff8c909e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2eb),
      inversePrimary: Color(0xff00439e),
      primaryFixed: Color(0xffd9e2ff),
      onPrimaryFixed: Color(0xff000f30),
      primaryFixedDim: Color(0xffb0c6ff),
      onPrimaryFixedVariant: Color(0xff00327a),
      secondaryFixed: Color(0xff8ffb85),
      onSecondaryFixed: Color(0xff001601),
      secondaryFixedDim: Color(0xff73dd6b),
      onSecondaryFixedVariant: Color(0xff004007),
      tertiaryFixed: Color(0xffd8e2ff),
      onTertiaryFixed: Color(0xff00102e),
      tertiaryFixedDim: Color(0xffb4c6f3),
      onTertiaryFixedVariant: Color(0xff23365a),
      surfaceDim: Color(0xff111319),
      surfaceBright: Color(0xff42444b),
      surfaceContainerLowest: Color(0xff06070d),
      surfaceContainerLow: Color(0xff1b1d24),
      surfaceContainer: Color(0xff26282e),
      surfaceContainerHigh: Color(0xff303239),
      surfaceContainerHighest: Color(0xff3c3d44),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffecefff),
      surfaceTint: Color(0xffb0c6ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffaac2ff),
      onPrimaryContainer: Color(0xff000a24),
      secondary: Color(0xffc6ffb9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff70d968),
      onSecondaryContainer: Color(0xff000f01),
      tertiary: Color(0xffecefff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb0c2ef),
      onTertiaryContainer: Color(0xff000a23),
      error: Color(0xffffecea),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffadaa),
      onErrorContainer: Color(0xff220002),
      surface: Color(0xff111319),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffedefff),
      outlineVariant: Color(0xffbfc2d1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2eb),
      inversePrimary: Color(0xff00439e),
      primaryFixed: Color(0xffd9e2ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb0c6ff),
      onPrimaryFixedVariant: Color(0xff000f30),
      secondaryFixed: Color(0xff8ffb85),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff73dd6b),
      onSecondaryFixedVariant: Color(0xff001601),
      tertiaryFixed: Color(0xffd8e2ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb4c6f3),
      onTertiaryFixedVariant: Color(0xff00102e),
      surfaceDim: Color(0xff111319),
      surfaceBright: Color(0xff4e5057),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d1f26),
      surfaceContainer: Color(0xff2e3037),
      surfaceContainerHigh: Color(0xff393b42),
      surfaceContainerHighest: Color(0xff45464e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => <ExtendedColor>[
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
