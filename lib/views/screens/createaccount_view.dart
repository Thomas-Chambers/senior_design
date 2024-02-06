import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_design/view_models/auth_view_model.dart';
import 'package:senior_design/utils/routes/routes_name.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  // Add a variable to track the selected role
  String? _selectedRole;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
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
        child: SingleChildScrollView( // Use SingleChildScrollView to avoid overflow when keyboard appears
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60.0), // Space at the top
              const Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedRole = 'Patient';
                          });
                          // Handle Patient button press
                        },
                        child: const Text('Patient'),
                        style: ElevatedButton.styleFrom(
                          primary: _selectedRole == 'Patient'
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedRole = 'Doctor';
                          });
                          // Handle Doctor button press
                        },
                        child: const Text('Doctor'),
                        style: ElevatedButton.styleFrom(
                          primary: _selectedRole == 'Doctor'
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
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
                  // if patient is selected, navigate to patient account screen
                  if (_selectedRole == 'Patient') {
                    Navigator.of(context).pushNamed(RoutesName.patientAccount);
                  }
                  // if doctor is selected, navigate to doctor account screen
                  if (_selectedRole == 'Doctor') {
                    Navigator.of(context).pushNamed(RoutesName.doctorAccount);
                  }
                  // Logic to handle account creation
                  // Make sure to handle the role as part of the account creation
                  // Map<String, String> data = {
                  //   'role': _selectedRole ?? 'Patient', // Default to 'Patient' if nothing is selected
                  //   'firstName': _firstNameController.text,
                  //   'lastName': _lastNameController.text,
                  //   'email': _emailController.text,
                  //   'password': _passwordController.text,
                  // };
                  // authViewModel.createAccount(context, data);
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Next', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 24.0), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
