import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/dynamic_Form_Field.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/navigation_Buttons.dart';
import 'package:flutter/material.dart';

class ListQuestion extends StatefulWidget {
  const ListQuestion({
    required this.questionAndAnswer,
    required this.onPrevious,
    required this.onNext,
    required this.viewModel,

    super.key,
  });

  final Map<Question, Answer> questionAndAnswer;
  final FormViewModel viewModel;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  State<ListQuestion> createState() => _ListQuestionState();
}

class _ListQuestionState extends State<ListQuestion> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _questionKeys =
  <int, GlobalKey<State<StatefulWidget>>>{};

  late List<Question> questions;
  List<String> disabled = <String>[
  ];

  @override
  void initState() {
    super.initState();
    questions =
        widget.questionAndAnswer.keys.toList()
          ..sort((Question a, Question b) => a.counter.compareTo(b.counter));
    for (Question question in questions) {
      _questionKeys[question.counter] = GlobalKey();
    }

    /*   WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 100), () {
          scrollToQuestion(5);
        });
    });*/
  }

  void scrollToQuestion(int counter) {
    final GlobalKey<State<StatefulWidget>>? key = _questionKeys[counter];
    if (key != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                ...questions.map((Question question) {
                  final Answer answer = widget.questionAndAnswer[question]!;
                  return Padding(
                    key: _questionKeys[question.counter],
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: _buildDynamicFormField(question, answer),
                  );
                }).toList(),
                NavigationButtons(
                  onPrevious: widget.onPrevious,
                  onNext: widget.onNext,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDynamicFormField(Question question, Answer answer) {
    return DynamicFormField(
      disabled: disabled,
      question: question,
      viewModel: widget.viewModel,
      answer: answer,
    );
  }

}
