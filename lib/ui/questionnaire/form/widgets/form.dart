import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/list_Question.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FormQuestions extends StatefulWidget {
  final Section section;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final FormViewModel viewModel;
  final GlobalKey<FormState> formKey;
  final ItemScrollController itemScrollController;

  const FormQuestions({
    required this.onNext,
    required this.onPrevious,
    required this.viewModel,
    required this.section,
    required this.formKey,
    required this.itemScrollController,
  });

  @override
  State<FormQuestions> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<FormQuestions> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.responseCard == null) {
      return const Column(children: <Widget>[LinearProgressIndicator()]);
    }

    return Form(
      key: widget.formKey,
      child: ListQuestion(
        questionAndAnswer: widget.viewModel.joinQuestionAndAnswer(
          widget.section.questions,
        ),
        onPrevious: widget.onPrevious,
        onNext: widget.onNext,
        itemScrollController: widget.itemScrollController,
      ),
    );
  }
}
