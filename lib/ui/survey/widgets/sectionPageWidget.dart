import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/ui/survey/widgets/questionFormWidget.dart';
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
    _scrollToPage(0);
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

  @override
  Widget build(BuildContext context) {
    final double listViewHeight =  MediaQuery.of(context).size.height * 0.7;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(widget.sections[_currentPage].title,
        style:  Theme.of(context).textTheme.titleLarge,),
        Text('em breve o StepPage',
          style:  Theme.of(context).textTheme.titleSmall,),
        SizedBox(
          height: listViewHeight,
          width: MediaQuery.of(context).size.width,
          child:ListView.builder(
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
  }
}
