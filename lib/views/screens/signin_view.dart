import 'package:flutter/material.dart';
import 'package:senior_design/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(), // This line will handle the back navigation
        ),
        // title: Text('Sign In'), // Optionally, you can also add a title here
        elevation: 0, // Removes the shadow under the app bar.
        backgroundColor: Colors.transparent, // Sets the AppBar background color to transparent
        foregroundColor: Theme.of(context).primaryColor, // Sets the icon color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(), // Add a Spacer to push everything towards the bottom
            const Text(
              'Sign in to Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Map<String, String> data = {
                  'email': _emailController.text,
                  'password': _passwordController.text,
                };
                authViewModel.login(context, data);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Sign in', style: TextStyle(fontSize: 18)),
              ),
            ),
            TextButton(
              onPressed: () {/* Forgot Password? action */},
              child: const Text('Forgot Password?'),
            ),
            Spacer(flex: 1), // Optionally, adjust the flex to manage the space distribution
          ],
        ),
      ),
    );
  }
}
