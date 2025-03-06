import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/questionnaire/section/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/question/widgets/dynamicFormField.dart';
import 'package:digprev_flutter/ui/questionnaire/section/widgets/navigationButtonsWidget.dart';
import 'package:flutter/material.dart';


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
                child: _buildDynamicFormField(
                  question,
                  currentFocusNode,
                  nextFocusNode,
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

  Widget _buildDynamicFormField(
      Question question,
      FocusNode currentFocusNode,
      FocusNode nextFocusNode,
      ) {
    return FutureBuilder<Answer?>(
      future: widget.viewModel.fetchAnswerByQuestionId(question.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<Answer?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if(snapshot.data != null){
          return DynamicFormField(
            question: question,
            focusNode: currentFocusNode,
            nextFocusNode: nextFocusNode,
            viewModel: widget.viewModel,
            answer: snapshot.data!,
          );
        }
        else return const Center( child: Text(' deu erradp'),);
      },
    );
  }

}
