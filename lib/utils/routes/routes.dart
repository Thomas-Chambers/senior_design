import 'package:senior_design/utils/routes/routes_name.dart';
import 'package:senior_design/views/screens/createaccount_view.dart';
import 'package:senior_design/views/screens/doctoraccount_view.dart';
import 'package:senior_design/views/screens/home_view.dart';
import 'package:senior_design/views/screens/patientaccount_view.dart';
import 'package:senior_design/views/screens/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:senior_design/views/screens/welcome_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case RoutesName.welcome:
        return MaterialPageRoute(builder: (context) => WelcomeView());
      case RoutesName.signin:
        return MaterialPageRoute(builder: (context) => SignInView());
      case RoutesName.createAccount:
        return MaterialPageRoute(builder: (context) => CreateAccountView());
      case RoutesName.patientAccount:
        return MaterialPageRoute(builder: (context) => PatientAccountView());
      case RoutesName.doctorAccount:
        return MaterialPageRoute(builder: (context) => DoctorAccountView());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("no route defined"),
            ),
          );
        });
    }
  }
}
