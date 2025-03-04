import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/home/widgets/bottomNavigationWidget.dart';
import 'package:digprev_flutter/ui/home/widgets/topAppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({required this.child, super.key});
  final StatefulNavigationShell child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(),
      body: child,
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: child.currentIndex,
        onTap: (int index) => child.goBranch(index),
      ),
    );
  }
}
