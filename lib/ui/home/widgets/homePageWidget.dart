import 'package:digprev_flutter/ui/home/widgets/topAppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({required this.child, super.key});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final router = GoRouter.of(context);

        if (router.canPop()) {
          router.pop(); // Volta para a tela anterior se houver histórico
          return false; // Não permite que o sistema feche o app
        } else {
          // Exibe um diálogo antes de sair do app
          final shouldExit = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Sair do app?'),
              content: const Text('Tem certeza que deseja sair?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Não'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Sim'),
                ),
              ],
            ),
          );

          return shouldExit ?? false; // Sai do app apenas se o usuário confirmar
        }
      },
      child: Scaffold(
        appBar: const TopBarWidget(),
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: 'Posts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: child.currentIndex, // Mantém o índice correto da aba
          onTap: (int index) => child.goBranch(index), // Navega entre as abas
        ),
      ),
    );
  }
}
