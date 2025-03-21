import 'package:digprev_flutter/ui/report/result/viewModels/result_ViewModel.dart';
import 'package:digprev_flutter/ui/report/result/widgets/resultExpansionTile.dart';
import 'package:flutter/material.dart';

class ResultPageWidget extends StatefulWidget {
  const ResultPageWidget({required this.viewModel, super.key});

  final ResultViewModel viewModel;

  @override
  State<ResultPageWidget> createState() => _ResultPageWidgetState();
}

class _ResultPageWidgetState extends State<ResultPageWidget> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onDataChanged);
  }

  void _onDataChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onDataChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (widget.viewModel.hasData) {
      return _buildListView();
    } else {
      return const Center(child: Text('Não há cartões de resposta disponíveis.'));
    }
  }

  Widget _buildListView() {
    return Column(
      children: <Widget>[
         Row(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
               child: Text('Ultimas Atualizações:',
                style: Theme.of(context).textTheme.titleLarge,),
             ),
           ],
         ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.viewModel.responseCard.length,
            itemBuilder: (BuildContext context, int index) {
              return ResultExpansionTileWidget(
                responseCard: widget.viewModel.responseCard[index],
                index: index + 1,
              );
            },
          ),
        ),
      ],
    );
  }
}
