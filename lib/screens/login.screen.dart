import 'package:flutter/material.dart';
import 'package:flutter_training_27nov/widgets/custom-button.widget.dart';

import '../services/api.service.dart';
import 'dashboard.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: emailController,
              ),
              TextField(
                controller: passwordController,
              ),
              CustomButton(
                label: 'Sign In',
                onPressed: () async {
                  // print(emailController.text);
                  // print(passwordController.text);
                  final result = await login(
                      email: emailController.text,
                      password: passwordController.text);

                  if (result) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
