import 'package:flutter/material.dart';
import 'package:senior_design/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'package:senior_design/view_models/amplify_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    // final _AuthViewModel = Provider.of<AuthViewModel>(context);
    final _AmplifyViewModel = Provider.of<AmplifyViewModel>(context);
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: //have text fields for email and password and a button to login
          Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Map data = {
                'username': _emailController.text,
                'email': _emailController.text,
                'password': _passwordController.text
              };
              AmplifyViewModel().signUpUser(context, data);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
