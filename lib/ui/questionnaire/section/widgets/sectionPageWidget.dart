import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/ui/questionnaire/section/widgets/questionFormWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/section/widgets/stepperIndicatorWidget.dart';
import 'package:flutter/material.dart';

class SectionPageWidget extends StatefulWidget {
  final List<Section> sections;

  const SectionPageWidget({required this.sections, super.key});

  @override
  State<SectionPageWidget> createState() => SectionPageState();
}

class SectionPageState extends State<SectionPageWidget> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _scrollToPage(0);
      }
    });
  }

  void onNext() {
    setState(() {
      if (_currentPage < widget.sections.length - 1) {
        _currentPage++;
        _scrollToPage(_currentPage);
      }
    });
  }

  void onPrevious() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
        _scrollToPage(_currentPage);
      }
    });
  }

  void _scrollToPage(int page) {
    setState(() {
      final double screenWidth = MediaQuery.of(context).size.width;
      _scrollController.animateTo(
        page * screenWidth,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _currentPage = page;
    });
  }

  bool _isStepCompleted(int step) {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double availableHeight = constraints.maxHeight;

        return Column(
          children: <Widget>[
            SizedBox(
              height: availableHeight * 0.05,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.sections[_currentPage].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: availableHeight * 0.1,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.sections.length < 3 ? 70 : 0,
                ),
                child: StepperIndicatorWidget(
                  currentStep: _currentPage,
                  totalSteps: widget.sections.length,
                  canMarkStepComplete: _isStepCompleted,
                  onStepTapped: _scrollToPage,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.sections.length,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionFormWidget(
                    questions: widget.sections[index].questions,
                    onPrevious: onPrevious,
                    onNext: onNext,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
