import 'dart:convert';

import 'package:digprev_flutter/config/dependencies.dart';
import 'package:digprev_flutter/config/firebase_options.dart';
import 'package:digprev_flutter/domain/use_cases/responseCardGenerator/responseCardGenerator.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedTextFieldComponent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:result_dart/result_dart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: providersRemote, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigPrev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final generator = Provider.of<ResponseCardGenerator>(context);
     generator.generate().fold(
         (sucess)=> print(sucess.toJson()),
         (failure) => print(failure)
     );
    return Scaffold(
      appBar: AppBar(title: const Text('Test Repository')),
      body: Center(
        child: OutlinedTextFieldComponent(
          titulo: "Nome",
          placeholder: "Digite seu nome",
          supportingText: "Nome completo",
          isError: false,
          errorText: "Nome inválido",
          keyboardType: TextInputType.text,
          onValueChange: (value) {
            print("Valor digitado: $value");
          },
        )

      ),
    );
  }
}
