import 'package:digprev_flutter/domain/models/enuns/inputType.dart';
import 'package:digprev_flutter/domain/models/enuns/typeCalculate.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:flutter/cupertino.dart';

class FormEducacaoFisicaWidget extends StatelessWidget {
  const FormEducacaoFisicaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Section s = Section(
        id: 1,
        title: 'Atividade Física no Trabalho',
        maxValue: 0,
        typeCalculate: TypeCalculate.ATIVIDADE_FISICA,
        textUnderBar: [],
        questions: [
          Question(
              id: 1,
              question: 'Atualmente você tem ocupação remunerada ou faz '
                  'trabalho voluntário fora de sua casa?',
              placeholder: 'Selecione uma opção',
              supportingText: 'Selecione uma opção',
              tooltipText: 'Inclui qualquer trabalho pago (CLT, autônomo, '
                  'freelancer) ou voluntariado realizado fora da sua '
                  'residência. Caso trabalhe remotamente, selecione a opção '
                  'correspondente à sua situação.',
              inputType: InputType.SIM_NAO,
              explanatoryTexts: explanatoryTexts,
              options: options
          )
        ]
    )
    return const Placeholder();
  }
}
