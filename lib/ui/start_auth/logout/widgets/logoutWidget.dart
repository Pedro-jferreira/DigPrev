import 'package:digprev_flutter/ui/start_auth/logout/viewModels/logoutViewModel.dart';
import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {

  final bool isExtended;
  final bool centerText;
  final LogoutViewModel logoutViewModel;

  const LogoutWidget({
    required this.isExtended,
    required this.logoutViewModel,
    this.centerText = false, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: (){ logoutViewModel.logout(); },
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
        mainAxisAlignment: isExtended
            ? (centerText ? MainAxisAlignment.center : MainAxisAlignment.start)
            : MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.primaryFixed,
          ),
          if (isExtended) ...<Widget>[
            const SizedBox(width: 8),
            Text(
              'Sair do Aplicativo',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primaryFixed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
