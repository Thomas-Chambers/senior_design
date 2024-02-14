import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // Example user profile data
  final Map<String, dynamic> _profileData = {
    'First Name': 'John',
    'Last Name': 'Doe',
    'Email Address': 'john.doe@example.com',
    'Date of Birth': '1985-08-15',
    'Gender': 'Male',
    'Weight': '180 lbs',
    'Height': '6 ft',
    'Injury Type': 'Broken Arm',
    'Date of Injury': '2023-01-10',
    'Past Injuries': 'Sprained Wrist (2020)',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ..._profileData.entries.map((entry) {
            return Card(
              child: ListTile(
                title: Text(entry.key),
                subtitle: Text(entry.value.toString()),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
