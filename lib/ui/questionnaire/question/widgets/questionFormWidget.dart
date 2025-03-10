import 'dart:async';

import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/ui/questionnaire/question/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/question/widgets/dynamicFormField.dart';
import 'package:digprev_flutter/ui/questionnaire/section/widgets/navigationButtonsWidget.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class QuestionFormWidget extends StatefulWidget {
  final List<Question> questions;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final FormViewModel viewModel;

  const QuestionFormWidget({
    required this.questions,
    required this.onNext,
    required this.onPrevious,
    required this.viewModel,
    super.key,
  });

  @override
  State<QuestionFormWidget> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  StreamSubscription<Result<ResponseCard>>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.viewModel.observerPending(widget.questions);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.questionAndAnswer.isEmpty ||
        widget.viewModel.responseCard == null) {
      return Form(
        key: _formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView(children: <Widget>[const LinearProgressIndicator()]),
        ),
      );
    }
    return Form(
      key: _formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.questions.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < widget.questions.length) {
              final Question question = widget.questions[index];
              final Answer answer =
                  widget.viewModel.questionAndAnswer[question]!;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: _buildDynamicFormField(question, answer),
              );
            } else {
              return NavigationButtonsWidget(
                onNext: widget.onNext,
                onPrevious: widget.onPrevious,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildDynamicFormField(Question question, Answer answer) {
    return DynamicFormField(
      question: question,
      viewModel: widget.viewModel,
      answer: answer,
    );
  }
}
