import 'package:digprev_flutter/ui/home/widgets/topAppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/src/route.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({required this.child, super.key});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        currentIndex: child.currentIndex, // passar esses parametros
        onTap: (int index) => child.goBranch(index), //passar esses parametros
      ),
    );
  }
}