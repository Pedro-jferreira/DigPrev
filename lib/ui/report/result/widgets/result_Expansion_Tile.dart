import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/report/pdf/widgets/shared_button.dart';
import 'package:digprev_flutter/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultExpansionTile extends StatefulWidget {
  const ResultExpansionTile({
    required this.responseCard,
    required this.index,
    super.key,
  });

  final int index;
  final ResponseCard responseCard;

  @override
  State<ResultExpansionTile> createState() => _ResultExpansionTileState();
}

class _ResultExpansionTileState extends State<ResultExpansionTile> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        shape: const Border(),
        title: Text(formatDate(widget.responseCard.date)),
        leading: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${widget.index}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryFixed,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        trailing: Icon(
          _customTileExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
        ),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 5,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SharedButton(responseCardId: widget.responseCard.id),
                FilledButton.icon(
                  onPressed: () {
                    context.pushNamed(
                      AppRoutes.resultChart.name,
                      pathParameters: <String, String>{
                        'id': '${widget.responseCard.id}',
                      },
                    );
                  },
                  icon: const Icon(Icons.visibility_rounded),
                  label: const Text('Ver Resultados'),
                ),
              ],
            ),
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customTileExpanded = expanded;
          });
        },
      ),
    );
  }
}
