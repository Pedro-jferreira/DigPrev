import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/core/states/progressState.dart';
import 'package:digprev_flutter/ui/questionnaire/questionnaire/viewModels/responseCardViewModel.dart';
import 'package:digprev_flutter/utils/helpers/sectionHelper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StageItem extends StatefulWidget {
  final Stage stage;

  final bool? isAvailable;
  final Function(ProgressState) onProgressStateChanged;
  final ResponseCardViewModel viewModel;

  const StageItem({
    required this.stage,
    required this.onProgressStateChanged,
    required this.viewModel,
    this.isAvailable = true,
    super.key,
  });

  @override
  State<StageItem> createState() => _StageItemState();
}

class _StageItemState extends State<StageItem> {
  ProgressState _progressState = ProgressState.NotStarted;
  double _progress = 0.0;


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
    setState(() {
      if (_progress < 0.1) {
        _progressState = ProgressState.NotStarted;
      } else if (_progress < 1.0 && _progress > 0.0) {
        _progressState = ProgressState.Running;
      } else
        _progressState = ProgressState.Complete;

      widget.onProgressStateChanged(_progressState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResponseCardViewModel>(
      builder: (
          BuildContext context,
          ResponseCardViewModel responseCardViewModel,
          Widget? child,
          ) {
        _progress = responseCardViewModel.getProgress(
          SectionHelper.flattenSections(widget.stage),
        );

        ProgressState newState;
        if (_progress < 0.1) {
          newState = ProgressState.NotStarted;
        } else if (_progress < 1.0 && _progress > 0.0) {
          newState = ProgressState.Running;
        } else {
          newState = ProgressState.Complete;
        }

        if (newState != _progressState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _progressState = newState;
              });
              widget.onProgressStateChanged(_progressState);
            }
          });
        }

        return Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
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
                    _getProgressWidget(_progressState, _progress, context),
                    if (widget.isAvailable!)
                      TextButton(
                        onPressed: () => _onPressed(context),
                        child: const Text('Acessar'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onPressed(BuildContext context) {
    context.pushNamed(
      AppRoutes.section.name,
      pathParameters: <String, String>{'id': '${widget.stage.id}'},
    );
  }

  Widget _getProgressWidget(
    ProgressState state,
    double progress,
    BuildContext context,
  ) {

    const double iconSize = 40.0;
    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: Center(
        child: switch (state) {
          ProgressState.NotStarted => Icon(
            Icons.cancel,
            color: Theme.of(context).colorScheme.error,
            size: iconSize,
          ),
          ProgressState.Running => SizedBox(
            width: (iconSize - 5),
            height: (iconSize - 5),
            child: CircularProgressIndicator(value: progress),
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
}
