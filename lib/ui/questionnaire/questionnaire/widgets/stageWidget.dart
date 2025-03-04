import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/core/enum/progressState.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Stagewidget extends StatefulWidget {
  final Stage stage;
  final bool? isAvailable;
  final Function(ProgressState) onProgressStateChanged;

  const Stagewidget({
    required this.stage,
    required this.onProgressStateChanged,
    this.isAvailable = true,
    super.key,
  });

  @override
  State<Stagewidget> createState() => _StagewidgetState();
}

class _StagewidgetState extends State<Stagewidget> {
  ProgressState _progressState = ProgressState.NotStarted;
  double _progress = 0.0;

  void _onPressed() {
    context.pushNamed(AppRoutes.section.name,
    pathParameters: <String, String>{'id': '${widget.stage.id}'});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateProgress();
      }
    });
  }

  void _updateProgress() {
    final double valueByViewModel = 0.0;
    if (valueByViewModel != _progress) {
      setState(() {
        _progress = valueByViewModel;
        if (_progress < 0.1) {
          _progressState = ProgressState.NotStarted;
        } else if (_progress < 1.0 && _progress > 0.0) {
          _progressState = ProgressState.Running;
        } else
          _progressState = ProgressState.Complete;
      });
    }
  }

  Widget _getProgressWidget() {
    const double iconSize =
        40.0; // Defina um tamanho fixo para todos os widgets

    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: Center(
        child: switch (_progressState) {
          ProgressState.NotStarted => Icon(
            Icons.cancel,
            color: Theme.of(context).colorScheme.error,
            size: iconSize,
          ),
          ProgressState.Running => SizedBox(
            width: (iconSize - 5),
            height: (iconSize - 5),
            child: CircularProgressIndicator(value: _progress),
          ),
          ProgressState.Complete => const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: iconSize,
          ),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  widget.stage.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _getProgressWidget(),
                if (widget.isAvailable!)
                  TextButton(
                    onPressed: _onPressed,
                    child: const Text('Acessar'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
