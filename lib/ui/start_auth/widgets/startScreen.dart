import 'package:digprev_flutter/routing/routes.dart';
import 'package:digprev_flutter/ui/start_auth/widgets/initialImageWidget.dart';
import 'package:digprev_flutter/ui/start_auth/widgets/introTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatefulWidget {
  final VoidCallback? onNavigateToLogin;

  const StartScreen({Key? key, this.onNavigateToLogin}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.goNamed(AppRoutes.login.name);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: ListView(
        children: <Widget>[
          FadeTransition(
            opacity: _fadeAnimation,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InitialImage(),
                const SizedBox(height: 10),
                InitialText(),
              ],
            )
          ),
        ],
      ),
    );
  }
}
