import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  final VoidCallback onLogout;
  final bool isExtended;

  const LogoutWidget({
    required this.onLogout,
    required this.isExtended,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ElevatedButton(
          onPressed: onLogout,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.primaryFixed,
            padding: isExtended
                ? const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                : EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            minimumSize: isExtended ? const Size(56, 55) : const Size(60, 40),
          ),
          child: Row(
            mainAxisAlignment:
            isExtended ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primaryFixed,
              ),
              if (isExtended) ...<Widget>[
                const SizedBox(width: 8),
                Text(
                  'Sair',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primaryFixed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
