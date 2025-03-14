import 'package:digprev_flutter/config/dependencies.dart';
import 'package:digprev_flutter/config/firebase_options.dart';
import 'package:digprev_flutter/data/repositories/userRepository/authNotifier.dart';
import 'package:digprev_flutter/routing/router.dart';
import 'package:digprev_flutter/ui/core/theme/themePreference.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: providersRemote, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ThemePreference.setTheme(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
  ThemePreference.setTheme(context);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Brightness>(
      valueListenable: ThemePreference.brightness,
      builder:
          (
            BuildContext context,
            Brightness brightness,
            _,
          ) => MaterialApp.router(
            title: 'DigPrev',
            theme: ThemePreference.getTheme(brightness),
            supportedLocales: const <Locale>[
              Locale('pt', 'BR'),
              Locale('en', 'US'),
              Locale('es', 'ES'),
            ],
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            localeResolutionCallback: (
              Locale? locale,
              Iterable<Locale> supportedLocales,
            ) {
              for (Locale supportedLocale in supportedLocales) {
                if (locale != null &&
                    locale.languageCode == supportedLocale.languageCode &&
                    locale.countryCode == supportedLocale.countryCode) {
                  return supportedLocale;
                }
              }
              return const Locale('pt', 'BR'); // Define português como padrão
            },
            routerConfig: router(authNotifier: context.watch<AuthNotifier>()),
          ),
    );
  }
}
