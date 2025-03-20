
import 'package:digprev_flutter/ui/users/users/view_models/usersViewModel.dart';
import 'package:flutter/material.dart';

class TitleActionWidget extends StatefulWidget {
  final String title;
  final bool withAction;
  final VoidCallback? onTapAction;
  final UsersViewModel usersViewModel;
  const TitleActionWidget({required this.withAction,
    required this.title, required this.usersViewModel, super.key,
    this.onTapAction});

  @override
  State<TitleActionWidget> createState() => _TitleActionWidgetState();
}

class _TitleActionWidgetState extends State<TitleActionWidget> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          if(widget.withAction)
            FilledButton(
                onPressed: (){
                  setState(() {
                    isEditing = !isEditing;
                  });
                  if (widget.onTapAction != null) {
                    widget.onTapAction!();
                  }
                },
                child: Text(
                  isEditing ?
                    'Salvar' :
                      'Editar',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
            )
        ],
      ),
    );
  }
}
