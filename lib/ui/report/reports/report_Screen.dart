import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/report/pdf/widgets/shared_button.dart';
import 'package:digprev_flutter/ui/report/reports/viewModels/Report_ViewModel.dart';
import 'package:digprev_flutter/ui/report/reports/widgets/List_Results.dart';
import 'package:digprev_flutter/ui/core/widgets/custom_App_Bar.dart';
import 'package:digprev_flutter/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  List<Stage> _stages = <Stage>[];
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
    } else {
      final Map<Section, SectionAnswer> sectionAnswers = widget.viewModel
          .joinSectionAndAnswer(_stages, _responseCard);

      return Scaffold(
        appBar: CustomAppBar(
          title: formatDate(_responseCard.date),
          actions: <Widget>[
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              child: SharedButton(
                viewModel: context.read(),
                responseCardId:_responseCard.id,
              color: Theme.of(context).colorScheme.primaryFixed,),
            ),
          ],
        ),
        body: ListViewResults(sectionAnswers: sectionAnswers),
      );
    }
  }
}
