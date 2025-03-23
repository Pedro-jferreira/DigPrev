import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:digprev_flutter/ui/start_auth/login/view_models/loginViewModel.dart';
import 'package:digprev_flutter/ui/start_auth/login/widgets/registerFormWidget.dart';
import 'package:digprev_flutter/ui/start_auth/start/widgets/initialImageWidget.dart';
import 'package:digprev_flutter/ui/start_auth/start/widgets/introTextWidget.dart';
import 'package:digprev_flutter/ui/start_auth/login/widgets/loginFormWidget.dart';
import 'package:digprev_flutter/utils/layoutUtils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? onNavigateToLogin;
  const LoginScreen({required this.loginViewModel,
    Key? key, this.onNavigateToLogin }) : super(key: key);

  final LoginViewModel loginViewModel;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool isLoginForm = true;

  void _switchToRegisterForm() {
    setState(() {
      isLoginForm = false;
    });
  }

  void _switchToLoginForm() {
    setState(() {
      isLoginForm = true;
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
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
      resizeToAvoidBottomInset: true,
      body: dynamicScreenSize(context),
    );
  }

  Widget dynamicScreenSize(BuildContext context) {
    final LayoutState layoutState = determineLayoutState(context);
    switch (layoutState) {
      case LayoutState.mobile:
        return smallScreen();
      case LayoutState.smallTablet:
        return smallScreen();
      case LayoutState.tablet:
        return biggerScreen();
      case LayoutState.desktop:
        return biggerScreen();
    }
  }

  Widget biggerScreen() {
    return Row(
      children: <Widget>[
        const Expanded(child: InitialImage()),
        Expanded(child: smallScreen())
      ],
    );
  }

  Widget smallScreen() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const InitialText(),
            isLoginForm ?
            LoginFormComponent(onRegisterPressed: _switchToRegisterForm,
              loginViewModel: widget.loginViewModel,)
                : RegisterFormComponent(onLoginPressed: _switchToLoginForm,
                              loginViewModel: widget.loginViewModel,)
          ],
        ),
      ),
    );
  }
}
