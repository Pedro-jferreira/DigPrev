import 'package:digprev_flutter/config/dependencies.dart';
import 'package:digprev_flutter/config/firebase_options.dart';
import 'package:digprev_flutter/domain/models/enuns/inputType.dart';
import 'package:digprev_flutter/domain/models/enuns/typeCalculate.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/section/stageLabel.dart';
import 'package:digprev_flutter/ui/core/widgets/bottomNavigationWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/topAppBarWidget.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/core/widgets/datePickerWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedPasswordTextFielWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedTextFieldWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/radiobuttonWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/selectWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/toolTipWidget.dart';
import 'package:digprev_flutter/ui/start_auth/widgets/startScreen.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/widgets/stagePageWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/restart/widgets/restartButtonWidget.dart';

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
    return MaterialApp(
      title: 'DigPrev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),

      supportedLocales: const <Locale>[
        Locale('pt', 'BR'),
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      localizationsDelegates: const <LocalizationsDelegate>[
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

      home: const TestScreen2(),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarWidget(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ajusta o tamanho da coluna
          children: <Widget>[
            OutlinedTextFieldComponent(
              title: 'Nome',
              toolTipText: 'um texto de tooltip',
              placeholder: 'Digite seu nome',
              supportingText: 'Nome completo',
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
              firstDate:  DateTime(DateTime.now().year - 110,
                  DateTime.now().month, DateTime.now().day),
              lastDate: DateTime.now(),
              initialDate:DateTime(2020, 11, 10) ,
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
            ),
          ],
        ),
      ),
    );
  }
}

class TestScreen2 extends StatelessWidget {
  const TestScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Option> options = <Option>[
      const Option(
        id: 1,
        question: 'opção 1',
        valueScore: 2,
        intensity: null,
        days: null,
      ),
      const Option(
        id: 2,
        question: 'opcão 2',
        valueScore: 2,
        intensity: null,
        days: null,
      ),
      const Option(
        id: 3,
        question: 'opção 3',
        valueScore: 2,
        intensity: null,
        days: null,
      ),
    ];

    final List<Question> questions = <Question>[
      const Question(
        id: 1,
        question: 'qual o seu peso?',
        placeholder: 'digite aqui',
        supportingText: 'digite seu peso',
        tooltipText: 'isso é um texto',
        inputType: InputType.TEXT_INPUT,
        explanatoryTexts: null,
        options: null,
      ),
      const Question(
        id: 1,
        question: 'qual o sua altura?',
        placeholder: 'digite aqui',
        supportingText: 'digite sua altura',
        tooltipText: 'isso é um texto',
        inputType: InputType.TEXT_INPUT,
        explanatoryTexts: null,
        options: null,
      ),
      const Question(
        id: 1,
        question: 'qual o seu nome?',
        placeholder: 'digite aqui',
        supportingText: 'digite seu nome',
        tooltipText: 'isso é um texto',
        inputType: InputType.TEXT_INPUT,
        explanatoryTexts: null,
        options: null,
      ),
      const Question(
        id: 1,
        question: 'qual o seu peso?',
        placeholder: 'digite aqui',
        supportingText: 'digite seu peso',
        tooltipText: 'isso é um texto',
        inputType: InputType.TEXT_INPUT,
        explanatoryTexts: null,
        options: null,
      ),
      const Question(
        id: 1,
        question: 'qual o sua altura?',
        placeholder: 'digite aqui',
        supportingText: 'digite sua altura',
        tooltipText: 'isso é um texto',
        inputType: InputType.TEXT_INPUT,
        explanatoryTexts: null,
        options: null,
      ),
      const Question(
        id: 1,
        question: 'qual o seu nome?',
        placeholder: 'digite aqui',
        supportingText: 'digite seu nome',
        tooltipText: 'isso é um texto',
        inputType: InputType.TEXT_INPUT,
        explanatoryTexts: null,
        options: null,
      ),
      const Question(
        id: 1,
        question: 'qual o seu peso?',
        placeholder: 'digite aqui',
        supportingText: 'digite seu peso',
        tooltipText: 'isso é um texto',
        inputType: InputType.TEXT_INPUT,
        explanatoryTexts: null,
        options: null,
      ),
      const Question(
        id: 1,
        question: 'qual o sua altura?',
        placeholder: 'digite aqui',
        supportingText: 'digite sua altura',
        tooltipText: 'isso é um texto',
        inputType: InputType.TEXT_INPUT,
        explanatoryTexts: null,
        options: null,
      ),
      const Question(
        id: 1,
        question: 'qual o seu nome?',
        placeholder: 'digite aqui',
        supportingText: 'digite seu nome',
        tooltipText: 'isso é um texto',
        inputType: InputType.TEXT_INPUT,
        explanatoryTexts: null,
        options: null,
      ),
    ];

    final List<Section> sections = [
      Section(
        id: 1,
        title: 'habitos de vida',
        maxValue: 0,
        typeCalculate: TypeCalculate.ATIVIDADE_FISICA,
        textUnderBar: const <StageLabel>[
          StageLabel(min: 1, max: 3, label: 'texto'),
          StageLabel(min: 4, max: 6, label: 'texto'),
          StageLabel(min: 7, max: 10, label: 'texto'),
        ],
        questions: questions,
      ),
      Section(
        id: 1,
        title: 'habitos de tabagicos',
        maxValue: 0,
        typeCalculate: TypeCalculate.ATIVIDADE_FISICA,
        textUnderBar: const <StageLabel>[
          StageLabel(min: 1, max: 3, label: 'texto'),
          StageLabel(min: 4, max: 6, label: 'texto'),
          StageLabel(min: 7, max: 10, label: 'texto'),
        ],
        questions: questions,
      ),
    ];

    List<Stage> stages = [
      Stage(
        id: 1,
        title: 'Dados Cadastrais',
        description: 'description',
        creationDate: DateTime.now(),
        sections: sections,
      ),
      Stage(
        id: 2,
        title: 'habitos de vida',
        description: 'description',
        creationDate: DateTime.now(),
        sections: sections,
      ),
      Stage(
        id: 3,
        title: 'perfil alimentar',
        description: 'description',
        creationDate: DateTime.now(),
        sections: sections,
      ),
      Stage(
        id: 4,
        title: '(In)Satisficação com Imagem Corporal ',
        description: 'description',
        creationDate: DateTime.now(),
        sections: sections,
      ),
      Stage(
        id: 5,
        title: 'Rastreio de sintomas de transtornos alimentares',
        description: 'description',
        creationDate: DateTime.now(),
        sections: sections,
      ),
    ];
    PageController pageController = PageController();

    return Scaffold(
      appBar: const TopBarWidget(),
      body: Center(
        child: StagePageWidget(stages: stages), // Centraliza o StagePageWidget
      ),
      floatingActionButton: const RestartButtonWidget(),
      bottomNavigationBar: BottomNavigationWidget(pageController: pageController),
    );
  }
}

class TestScreenStart extends StatelessWidget{
  const TestScreenStart({super.key});

  @override
  Widget build(BuildContext context) {


    return const Scaffold(
      body: StartScreen()
    );
  }
}