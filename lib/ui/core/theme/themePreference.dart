import 'package:digprev_flutter/ui/core/theme/theme.dart';
import 'package:digprev_flutter/ui/core/theme/util.dart';
import 'package:flutter/material.dart';

class ThemePreference {
  static ValueNotifier<Brightness> brightness = ValueNotifier<Brightness>(
    Brightness.light,
  );
  static MaterialTheme? materialTheme;

  static void setTheme(BuildContext context) {
    brightness.value =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final TextTheme textTheme = createTextTheme(context, 'Raleway', 'Raleway');
    materialTheme = MaterialTheme(textTheme);
  }

  static ThemeData? getTheme(Brightness brightness) {
    return brightness == Brightness.light
        ? materialTheme?.light()
        : materialTheme?.dark();
  }
}
