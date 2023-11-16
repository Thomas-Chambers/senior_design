import 'package:flutter/material.dart';
import 'package:senior_design/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final _AuthViewModel = Provider.of<AuthViewModel>(context);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Map data = {
                    'email': _emailController.text,
                    'password': _passwordController.text
                  };
                  _AuthViewModel.login(context, data);
                },
                child: const Text('Login'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Map data = {
                    'email': _emailController.text,
                    'password': _passwordController.text
                  };
                  _AuthViewModel.signup(context, data);
                },
                child: const Text('Sign Up'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
