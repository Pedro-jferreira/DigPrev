import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final bool? leading;

  const TopBarWidget({this.leading, Key? key}) : super(key: key);

  @override
  _TopBarComponentState createState() => _TopBarComponentState();

  @override
  Size get preferredSize => const Size.fromHeight(60); // Define a altura preferida
}

class _TopBarComponentState extends State<TopBarWidget> {
  bool _hasNotifications = false; // Exemplo de estado

  void _toggleNotifications() {
    setState(() {
      _hasNotifications = !_hasNotifications; // Altera o estado ao clicar
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          widget.leading == true
              ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => GoRouter.of(context).pop(),
              )
              : null,
      elevation: 3,
      foregroundColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.shadow,
      toolbarHeight: 60,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          'DigPrev',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: _toggleNotifications, // Altera estado ao clicar
            iconSize: 30.0,
            icon: Icon(
              _hasNotifications
                  ? Icons
                      .notifications_active // Ícone quando há notificações
                  : Icons.notifications, // Ícone padrão
            ),
          ),
        ),
      ],
    );
  }
}
