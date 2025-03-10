import 'package:digprev_flutter/ui/start_auth/view_models/loginViewModel.dart';
import 'package:digprev_flutter/ui/start_auth/widgets/RegisterFormWidget.dart';
import 'package:digprev_flutter/ui/start_auth/widgets/introTextWidget.dart';
import 'package:digprev_flutter/ui/start_auth/widgets/loginFormWidget.dart';
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
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          left: 20,
          right: 20,
          top: 100,
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const InitialText(),
              const SizedBox(height: 30),
              isLoginForm ?
              LoginFormComponent(onRegisterPressed: _switchToRegisterForm,
                loginViewModel: widget.loginViewModel,)
                  : RegisterFormComponent(onLoginPressed: _switchToLoginForm,
                      loginViewModel: widget.loginViewModel,)
            ],
          ),
        ),
      ),
    );
  }
}
