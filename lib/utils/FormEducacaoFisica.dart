import 'package:digprev_flutter/domain/models/enuns/inputType.dart';
import 'package:digprev_flutter/domain/models/enuns/typeCalculate.dart';
import 'package:digprev_flutter/domain/models/question/explanatoryTexts.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/section/stageLabel.dart';
import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';

class FormEducacaoFisicaWidget extends StatelessWidget {
  const FormEducacaoFisicaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Section s = Section(
        id: 4,
        title: 'Atividade Física no Trabalho',
        maxValue: 0,
        typeCalculate: TypeCalculate.ATIVIDADE_FISICA,
        textUnderBar: <StageLabel>[],
        questions: <Question>[
          Question(
              id: ObjectId().hexString,
              question: 'Atualmente você tem ocupação remunerada ou faz '
                  'trabalho voluntário fora de sua casa?',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Inclui qualquer trabalho pago (CLT, autônomo, '
                  'freelancer) ou voluntariado realizado fora da sua '
                  'residência. Caso trabalhe remotamente responda não.',
              inputType: InputType.SIM_NAO,
              explanatoryTexts: <ExplanatoryTexts>[],
              optionsQuestions: <Option>[],
              counter: 1,
              disableQuestions: <String>['2','3','4','5']
          ),
          Question(
              id: ObjectId().hexString,
              question: 'Quantos dias e qual o tempo (horas e minutos) durante '
                  'uma semana normal você realiza atividades vigorosas como:',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Considere apenas atividades físicas intensas '
                  'realizadas no trabalho remunerado ou voluntário, que '
                  'envolvam grande esforço, como carregar pesos ou cavar, '
                  'por pelo menos 10 minutos seguidos. Inclua a quantidade '
                  'de dias e o tempo total semanal (horas e minutos).',
              inputType: InputType.FREQUENCY_TIME,
              explanatoryTexts: <ExplanatoryTexts>[
                const ExplanatoryTexts(
                  explanatoryText: 'Trabalho de construção pesada, levantar e '
                      'transportar objetos pesados, cortar lenha, serrar madeira, '
                      'cortar grama, pintar casa, cavar valas ou buracos como '
                      'parte do seu trabalho remunerado ou voluntário, por '
                      'pelo menos 10 minutos contínuos?'
                )
              ],
              optionsQuestions: <Option>[],
              counter: 2,
              disableQuestions: <String>[]
          ),
          Question(
              id: ObjectId().hexString,
              question: 'Quantos dias e qual o tempo durante uma semana normal '
                  'você realiza atividades moderadas como:',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Inclua apenas atividades físicas de intensidade '
                  'moderada realizadas no trabalho remunerado ou voluntário, '
                  'como varrer, carregar pequenos objetos ou limpar vidros, '
                  'por pelo menos 10 minutos seguidos. Informe a quantidade de '
                  'dias e o tempo total semanal (horas e minutos).',
              inputType: InputType.FREQUENCY_TIME,
              explanatoryTexts: <ExplanatoryTexts>[
                const ExplanatoryTexts(
                    explanatoryText: 'Levantar e transportar pequenos objetos, '
                        'lavar roupas com as mãos, limpar vidros, varrer ou '
                        'limpar o chão, carregar crianças no colo, como parte '
                        'do seu trabalho remunerado ou voluntário?'
                )
              ],
              optionsQuestions: <Option>[],
              counter: 3,
              disableQuestions: <String>[]
          ),
          Question(
              id: ObjectId().hexString,
              question: 'Quantos dias e qual o tempo durante uma semana '
                  'normal você caminha no seu trabalho remunerado ou voluntário '
                  'por pelo menos 10 minutos contínuos? (NÃO INCLUA o caminhar '
                  'como transporte para ir ou voltar do trabalho.)',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Considere apenas caminhadas realizadas como parte '
                  'do seu trabalho remunerado ou voluntário, por pelo menos 10 '
                  'minutos seguidos. Não inclua deslocamentos para ir ou '
                  'voltar do trabalho. Informe a quantidade de dias e o tempo '
                  'total semanal (horas<ExplanatoryTexts> e minutos).',
              inputType: InputType.FREQUENCY_TIME,
              explanatoryTexts: <ExplanatoryTexts>[],
              optionsQuestions: <Option>[],
              counter: 4,
              disableQuestions: <String>['5']
          ),
          Question(
              id: ObjectId().hexString,
              question: 'Quando você caminha como parte do seu trabalho '
                  'remunerado ou voluntário, a que passo você geralmente anda?',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Informe o ritmo médio da sua caminhada durante '
                  'o trabalho remunerado ou voluntário, considerando se é '
                  'lento, moderado ou rápido. Não inclua deslocamentos '
                  'para ir ou voltar do trabalho.',
              inputType: InputType.RADIOBUTTON,
              explanatoryTexts: <ExplanatoryTexts>[],
              optionsQuestions: <Option>[
                const Option(
                    counter: 1,
                    text: 'rápido/vigoroso',
                    valueScore: 0,
                    intensity: '8.0'
                ),
                const Option(
                    counter: 2,
                    text: 'moderado',
                    valueScore: 0,
                    intensity: '4.0'
                ),
                const Option(
                    counter: 3,
                    text: 'lento',
                    valueScore: 0,
                    intensity: '3.3'
                )
              ],
              counter: 5,
              disableQuestions: <String>[]
          ),
        ],
    );
    final Section s2 = Section(
      id: 5,
      title: 'Atividade Física como Meio de Transporte',
      maxValue: 0,
      typeCalculate: TypeCalculate.ATIVIDADE_FISICA,
      textUnderBar: <StageLabel>[],
      questions: <Question>[
        Question(
            id: ObjectId().hexString,
            question: 'Quantos dias e qual o tempo durante uma semana normal '
                'você anda de ônibus, carro/moto, metrô ou trem?',
            placeholder: 'Selecione uma opção',
            supportingText: 'Selecione uma opção',
            tooltipText: 'Considere apenas o tempo gasto dentro do veículo '
                'durante seus deslocamentos semanais. Inclua ônibus, carro, '
                'moto, metrô ou trem, e informe a quantidade de dias e o tempo '
                'total semanal (horas e minutos).',
            inputType: InputType.FREQUENCY_TIME,
            explanatoryTexts: <ExplanatoryTexts>[],
            optionsQuestions: <Option>[],
            counter: 1,
            disableQuestions: <String>[]
        ),
        Question(
            id: ObjectId().hexString,
            question: 'Quantos dias e qual o tempo durante uma semana normal '
                'você anda de bicicleta para ir de um lugar para outro por '
                'pelo menos 10 minutos contínuos? (NÃO INCLUA o pedalar por '
                'lazer ou exercício.)',
            placeholder: 'Selecione uma opção',
            supportingText: 'Selecione uma opção',
            tooltipText: 'Considere apenas o tempo em que você pedala como '
                'meio de transporte para se deslocar de um lugar para outro, '
                'por pelo menos 10 minutos seguidos. Não inclua pedaladas '
                'por lazer ou exercício. Informe a quantidade de dias e o '
                'tempo total semanal (horas e minutos)',
            inputType: InputType.FREQUENCY_TIME,
            explanatoryTexts: <ExplanatoryTexts>[],
            optionsQuestions: <Option>[],
            counter: 2,
            disableQuestions: <String>['4']
        ),
        Question(
            id: ObjectId().hexString,
            question: 'Quando você anda de bicicleta, a que velocidade você '
                'costuma pedalar?',
            placeholder: 'Selecione uma opção',
            supportingText: 'Selecione uma opção',
            tooltipText: 'Informe a velocidade média ao pedalar, considerando '
                'se é leve, moderada ou intensa. Caso não saiba a velocidade '
                'exata, baseie-se no esforço físico percebido durante o trajeto.',
            inputType: InputType.RADIOBUTTON,
            explanatoryTexts: <ExplanatoryTexts>[],
            optionsQuestions: <Option>[
              const Option(
                  counter: 1,
                  text: 'rápido/vigoroso',
                  valueScore: 0,
                  intensity: '8.0'
              ),
              const Option(
                  counter: 2,
                  text: 'moderado',
                  valueScore: 0,
                  intensity: '4.0'
              ),
              const Option(
                  counter: 3,
                  text: 'lento',
                  valueScore: 0,
                  intensity: '3.3'
              )
            ],
            counter: 3,
            disableQuestions: <String>[]
        ),
        Question(
            id: ObjectId().hexString,
            question: 'Quantos dias e qual o tempo durante uma semana normal '
                'você caminha para ir de um lugar para outro, como:',
            placeholder: 'Selecione uma opção',
            supportingText: 'Selecione uma opção',
            tooltipText: 'Considere apenas caminhadas realizadas como meio de '
                'transporte para ir a locais como igreja, mercado ou médico, '
                'por pelo menos 10 minutos seguidos. Não inclua caminhadas por '
                'lazer ou exercício. Informe a quantidade de dias e o tempo '
                'total semanal (horas e minutos).',
            inputType: InputType.FREQUENCY_TIME,
            explanatoryTexts: <ExplanatoryTexts>[
              const ExplanatoryTexts(
                explanatoryText: 'Ir ao grupo de convivência/idosos, igreja, '
                    'supermercado, médico, banco, visita a amigo, vizinho e '
                    'parentes por pelo menos 10 minutos contínuos. (NÃO inclua '
                    'caminhadas por lazer ou exercício.)'
              )
            ],
            optionsQuestions: <Option>[],
            counter: 4,
            disableQuestions: <String>['5']
        ),
        Question(
            id: ObjectId().hexString,
            question: 'Quando você caminha para ir de um lugar a outro, a que '
                'passo você normalmente anda?',
            placeholder: 'Selecione uma opção',
            supportingText: 'Selecione uma opção',
            tooltipText: 'Informe o ritmo médio da sua caminhada ao se '
                'deslocar de um lugar a outro, considerando se é lento, '
                'moderado ou rápido. Não inclua caminhadas por lazer ou '
                'exercício.',
            inputType: InputType.RADIOBUTTON,
            explanatoryTexts: <ExplanatoryTexts>[],
            optionsQuestions: <Option>[
              const Option(
                  counter: 1,
                  text: 'rápido/vigoroso',
                  valueScore: 0,
                  intensity: '8.0'
              ),
              const Option(
                  counter: 2,
                  text: 'moderado',
                  valueScore: 0,
                  intensity: '4.0'
              ),
              const Option(
                  counter: 3,
                  text: 'lento',
                  valueScore: 0,
                  intensity: '3.3'
              )
            ],
            counter: 5,
            disableQuestions: <String>[]
        ),
      ]
    );
    final Section s3 = Section(
        id: 6,
        title: 'Atividade Física em Casa, Tarefas Domésticas e Cuidado '
            'com a Família',
        maxValue: 0,
        typeCalculate: TypeCalculate.ATIVIDADE_FISICA,
        textUnderBar: <StageLabel>[],
        questions: <Question>[
          Question(
              id: ObjectId().hexString,
              question: 'Quantos dias e qual o tempo durante uma semana normal '
                  'você faz atividades físicas vigorosas em casa como:',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Considere apenas atividades físicas intensas '
                  'realizadas em casa, como carpintaria, cortar lenha ou '
                  'carregar objetos pesados, por pelo menos 10 minutos seguidos. '
                  'Informe a quantidade de dias e o tempo total semanal (horas '
                  'e minutos).',
              inputType: InputType.FREQUENCY_TIME,
              explanatoryTexts: <ExplanatoryTexts>[
                const ExplanatoryTexts(
                  explanatoryText: 'Carpintaria, cortar lenha, serrar madeira, '
                      'pintar casa, levantar e transportar objetos pesados, '
                      'cortar grama por pelo menos 10 minutos contínuos?'
                )
              ],
              optionsQuestions: <Option>[],
              counter: 1,
              disableQuestions: <String>[]
          ),
          Question(
              id: ObjectId().hexString,
              question: 'Quantos dias e qual o tempo durante uma semana normal '
                  'você faz atividades moderadas como:',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Inclua apenas atividades físicas de intensidade '
                  'moderada realizadas em casa, como jardinagem, carregar '
                  'pequenos objetos ou brincar ativamente com crianças, por '
                  'pelo menos 10 minutos seguidos. Informe a quantidade de dias '
                  'e o tempo total semanal (horas e minutos).',
              inputType: InputType.FREQUENCY_TIME,
              explanatoryTexts: <ExplanatoryTexts>[
                const ExplanatoryTexts(
                  explanatoryText: 'Carregar pequenos objetos, limpar garagem, '
                      'jardinagem, caminhar ou correr com crianças por pelo '
                      'menos 10 minutos contínuos?'
                )
              ],
              optionsQuestions: <Option>[],
              counter: 2,
              disableQuestions: <String>[]
          ),
        ]
    );
    final Section s4 = Section(
        id: 7,
        title: 'Atividades Físicas de Recreação, Esporte, Exercício e de Lazer',
        maxValue: 0,
        typeCalculate: TypeCalculate.ATIVIDADE_FISICA,
        textUnderBar: <StageLabel>[],
        questions: <Question>[
          Question(
              id: ObjectId().hexString,
              question: 'Quantos dias e qual o tempo durante uma semana normal '
                  'você caminha no seu tempo livre por pelo menos 10 minutos '
                  'contínuos?',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Considere apenas caminhadas realizadas no seu '
                  'tempo livre, como lazer ou recreação, por pelo menos 10 '
                  'minutos seguidos. Informe a quantidade de dias e o tempo '
                  'total semanal (horas e minutos).',
              inputType: InputType.FREQUENCY_TIME,
              explanatoryTexts: <ExplanatoryTexts>[],
              optionsQuestions: <Option>[],
              counter: 1,
              disableQuestions: <String>[]
          ),
          Question(
              id: ObjectId().hexString,
              question: 'Quantos dias e qual o tempo durante uma semana normal '
                  'você faz atividades vigorosas no seu tempo livre, como:',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Inclua apenas atividades físicas intensas '
                  'realizadas no seu tempo livre, como corrida, natação rápida, '
                  'ciclismo rápido, musculação ou esportes, por pelo menos 10 '
                  'minutos seguidos. Informe a quantidade de dias e o tempo '
                  'total semanal (horas e minutos).',
              inputType: InputType.FREQUENCY_TIME,
              explanatoryTexts: <ExplanatoryTexts>[
                const ExplanatoryTexts(
                    explanatoryText: 'Correr, nadar rápido, pedalar rápido, '
                        'musculação, esportes em geral?'
                )
              ],
              optionsQuestions: <Option>[],
              counter: 2,
              disableQuestions: <String>[]
          ),
        ]
    );
    final Section s5 = Section(
        id: 8,
        title: 'Tempo Gasto Sentado',
        maxValue: 0,
        typeCalculate: TypeCalculate.ATIVIDADE_FISICA,
        textUnderBar: <StageLabel>[],
        questions: <Question>[
          Question(
              id: ObjectId().hexString,
              question: 'Quanto tempo, no total, você gasta sentado durante um '
                  'dia de semana normal?',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Informe o tempo total que você passa sentado em '
                  'um dia de semana típico, incluindo trabalho, estudo, lazer '
                  '(TV, leitura, computador) e refeições. Considere todas as '
                  'atividades sedentárias ao longo do dia.',
              inputType: InputType.FREQUENCY_TIME,
              explanatoryTexts: <ExplanatoryTexts>[],
              optionsQuestions: <Option>[],
              counter: 1,
              disableQuestions: <String>[]
          ),
          Question(
              id: ObjectId().hexString,
              question: 'Quanto tempo, no total, você gasta sentado durante '
                  'um dia de final de semana normal?',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Informe o tempo total que você passa sentado em '
                  'um dia típico de final de semana, incluindo atividades '
                  'como assistir TV, usar o computador, ler, refeições e '
                  'outras atividades sedentárias.',
              inputType: InputType.FREQUENCY_TIME,
              explanatoryTexts: <ExplanatoryTexts>[],
              optionsQuestions: <Option>[],
              counter: 2,
              disableQuestions: <String>[]
          ),
        ]
    );

    return const Placeholder();
  }
}
