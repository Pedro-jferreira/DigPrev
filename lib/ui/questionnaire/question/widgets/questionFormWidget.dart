import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedTextFieldWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/question/widgets/dynamicFormField.dart';
import 'package:digprev_flutter/ui/questionnaire/section/widgets/navigationButtonsWidget.dart';
import 'package:flutter/material.dart';

class QuestionFormWidget extends StatefulWidget {
  final List<Question> questions;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const QuestionFormWidget({
    required this.questions,
    required this.onNext,
    required this.onPrevious,
    super.key,
  });

  @override
  State<QuestionFormWidget> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  final List<FocusNode> _focusNodes = <FocusNode>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.questions.length; i++) {
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _navigateToTextField(0);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (final FocusNode node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _navigateToTextField(int index) {
    if (index >= 0 && index < widget.questions.length) {
      final FocusNode focusNode = _focusNodes[index];
      final BuildContext? context = focusNode.context;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
        );
        FocusScope.of(context).requestFocus(focusNode);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.questions.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < widget.questions.length) {
              final FocusNode currentFocusNode = _focusNodes[index];
              final FocusNode nextFocusNode =
              index + 1 < _focusNodes.length
                  ? _focusNodes[index + 1]
                  : FocusNode();
              final Question question = widget.questions[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: DynamicFormField(
                  question: question,
                  onChanged: (value) {
                    print(value);
                  },
                  focusNode: currentFocusNode,
                  // Passa o FocusNode para o campo
                  nextFocusNode: nextFocusNode,
                ),
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
}
