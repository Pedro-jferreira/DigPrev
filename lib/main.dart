import 'package:digprev_flutter/config/dependencies.dart';
import 'package:digprev_flutter/config/firebase_options.dart';
import 'package:digprev_flutter/ui/core/widgets/datePickerWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedPasswordTextFielWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedTextFieldWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/radiobuttonWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/selectWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/toolTipWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Test Repository')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ajusta o tamanho da coluna
          children: <Widget>[
            OutlinedTextFieldComponent(
              titulo: 'Nome',
              placeholder: 'Digite seu nome',
              supportingText: 'Nome completo',
              errorText: 'Nome inválido',
              onValueChange: (String value) {
                print('Valor digitado: $value');
              },
            ),
            const SizedBox(height: 20),
            // Espaço entre o TextField e o DatePicker
            DatePickerWidget(
              labelText: 'selecione uma data de nascimento',
              onDateSelected: (DateTime value) {
                print(value);
              },
            ),
            const SizedBox(height: 20),
            const ToolTipWidget(
              labelText:
                  'Indique seu peso em quilogramas. Essa '
                  'informação é importante para calcular seu Índice '
                  'de Massa Corporal (IMC).',
            ),
            OutlinedPasswordTextFieldComponent(
              titulo: 'Senha',
              placeholder: 'Digite sua senha',
              onValueChange: (value) {
                print('Senha digitada: $value');
              },
            ),
            RadioButtonComponent(
              textQuestion: 'Qual sua renda mensal?',
              radioOptions: ['Baixa', 'Média', 'Alta'],
              initialSelection: 'Média',
              onSelectionChanged: (value) {
                print('Opção selecionada: $value');
              },
            ),
            SelectComponent(
              textInputQuestion: 'Qual seu gênero?',
              selectTexts: ['Mona', 'Caminhão', 'Fluido'],
              selectedValue: '',
              onItemSelected: (index, value) {
                print('Selecionado: $value na posição $index');
              },
            )
          ],
        ),
      ),
    );
  }
}
