import 'dart:async';

import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/sliverAppBarWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/sliverListQuestion.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class QuestionFormWidget extends StatefulWidget {
  final Section section;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final FormViewModel viewModel;

  const QuestionFormWidget({
    required this.onNext,
    required this.onPrevious,
    required this.viewModel,
    required this.section,
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
    _subscription = widget.viewModel.observerPending(widget.section.questions);
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.responseCard == null) {
      return  const Column(children: <Widget>[LinearProgressIndicator()], );
    }
    return Form(
      key: _formKey,
      child: CustomScrollView(
        controller: _scrollController,
        primary: false,
        slivers: <Widget>[
          SliverAppBarWidget(title: widget.section.title),
          SliverListQuestion(
              questionAndAnswer: widget.viewModel.joinQuestionAndAnswer(
                  widget.section.questions),
              onPrevious: widget.onPrevious,
              onNext: widget.onNext,
              viewModel: widget.viewModel)
        ],
      ),
    );
  }
}
