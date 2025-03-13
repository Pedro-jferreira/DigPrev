import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultExpansionTileWidget extends StatefulWidget {
  const ResultExpansionTileWidget({
    required this.responseCard,
    required this.index,
    super.key,
  });

  final int index;
  final ResponseCard responseCard;

  @override
  State<ResultExpansionTileWidget> createState() =>
      _ResultExpansionTileWidgetState();
}

class _ResultExpansionTileWidgetState extends State<ResultExpansionTileWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(widget.responseCard.date);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
          shape: const Border(),
        title: Text(formattedDate),
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
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share_rounded,
                  color: Theme.of(context).colorScheme.primary,),
                ),
                FilledButton.icon(
                  onPressed: () {},
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
