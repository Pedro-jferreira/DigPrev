import 'package:digprev_flutter/ui/start_auth/widgets/RegisterFormWidget.dart';
import 'package:digprev_flutter/ui/start_auth/widgets/introTextWidget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback? onNavigateToLogin;
  const RegisterScreen({Key? key, this.onNavigateToLogin}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool _isFormValid = false;

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
          top: 20,
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(  // Removi o const para usar ValueListenableBuilder
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const InitialText(),
              RegisterFormComponent(
                onFormValidationChanged: (isValid) {
                  print("validade: " + isValid.toString());
                  setState(() {
                    _isFormValid = isValid;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
