import 'package:digprev_flutter/config/dependencies.dart';
import 'package:digprev_flutter/config/firebase_options.dart';
import 'package:digprev_flutter/data/repositories/userRepository/authNotifier.dart';
import 'package:digprev_flutter/routing/router.dart';
import 'package:digprev_flutter/ui/core/theme/theme.dart';
import 'package:digprev_flutter/ui/core/theme/util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: providersRemote, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness =
        View.of(context).platformDispatcher.platformBrightness;
    final TextTheme textTheme = createTextTheme(context, 'Raleway', 'Raleway');
    final MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      title: 'DigPrev',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
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
    );
  }
}
