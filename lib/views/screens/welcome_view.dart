import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_design/view_models/auth_view_model.dart';
import 'package:senior_design/utils/routes/routes_name.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(), // Add a Spacer to push everything towards the bottom
            const Text(
              'Welcome to Recover',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48.0), // Increased space for aesthetic purposes
            ElevatedButton(
              onPressed: () {
                // Navigate to the SignIn view or perform sign-in action
                Navigator.of(context).pushNamed(RoutesName.signin);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Sign In', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 24.0), // Spacing between buttons
            OutlinedButton(
              onPressed: () {
                // Navigate to the Create Account view or perform account creation action
                Navigator.of(context).pushNamed(RoutesName.createAccount);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Create Account', style: TextStyle(fontSize: 18)),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Theme.of(context).primaryColor), // Adding outline
              ),
            ),
            Spacer(flex: 1), // Optionally, adjust the flex to manage the space distribution
          ],
        ),
      ),
    );
  }
}
