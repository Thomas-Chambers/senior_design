import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_design/view_models/user_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

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
          ...userToMap(userViewModel).entries.map((entry) {
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

  static Map<String, dynamic> userToMap(UserViewModel userViewModel){
    return {
      'First Name': userViewModel.user.firstName,
      'Last Name': userViewModel.user.lastName,
      'Email Address': userViewModel.user.email,
      'Date of Birth': userViewModel.user.dateOfBirth,
      'Gender': userViewModel.user.gender,
      'Weight': userViewModel.user.weight,
      'Height': userViewModel.user.height,
      'Injury Type': userViewModel.user.injuryType,
      'Date of Injury': userViewModel.user.dateOfInjury,
      'Past Injuries': userViewModel.user.pastInjuries,
      'Total Workouts': userViewModel.user.totalWorkouts
    };
  }
}
