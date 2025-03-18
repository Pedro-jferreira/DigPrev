import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/section/stageLabel.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/report/reports/viewModels/Report_VielModel.dart';
import 'package:digprev_flutter/ui/report/reports/widgets/resultIndicatorCardWidget.dart';
import 'package:digprev_flutter/ui/report/reports/widgets/sliver_List_Results.dart';
import 'package:digprev_flutter/ui/report/reports/widgets/sliver_app_Bar_Result.dart';
import 'package:digprev_flutter/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';

class reportPageWidget extends StatefulWidget {
  const reportPageWidget({
    required this.id,
    required this.viewModel,
    super.key,
  });

  final String id;
  final ReportViewModel viewModel;

  @override
  State<reportPageWidget> createState() => _reportPageWidgetState();
}

class _reportPageWidgetState extends State<reportPageWidget> {
  List<Stage> _stages = [];
  late ResponseCard _responseCard;

  void _onFetchStage() {
    final CommandState<List<Stage>> snapshot =
        widget.viewModel.loadComand.value;
    if (snapshot is SuccessCommand<List<Stage>>) {
      setState(() {
        _stages = snapshot.value;
      });
    } else if (snapshot is FailureCommand<List<Stage>>) {}
  }

  void _onLoadData() {
    final CommandState<ResponseCard> snapshot =
        widget.viewModel.findByIdCommand.value;
    if (snapshot is SuccessCommand<ResponseCard>) {
      setState(() {
        _responseCard = snapshot.value;
      });
    } else if (snapshot is FailureCommand<ResponseCard>) {}
  }

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onFetchStage);
    widget.viewModel.addListener(_onLoadData);
    widget.viewModel.loadStages();
    widget.viewModel.loadResponse(widget.id);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onFetchStage);
    widget.viewModel.removeListener(_onLoadData);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.findByIdCommand.isRunning ||
        widget.viewModel.loadComand.isRunning) {
      return const Center(child: CircularProgressIndicator());
    }else{
    final Map<Section, SectionAnswer> sectionAnswers =  widget.viewModel
        .joinSectionAndAnswer(_stages, _responseCard);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBarResult(title: formatDate(_responseCard.date)),
            SliverListResults(sectionAnswers: sectionAnswers),
          ],
        );
      },
    );}
  }
}
