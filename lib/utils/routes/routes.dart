import 'package:flutter/cupertino.dart';
import 'package:senior_design/utils/routes/routes_name.dart';
import 'package:senior_design/views/home_view.dart';
import 'package:senior_design/views/login_view.dart';
import 'package:senior_design/views/profile_view.dart';
import 'package:senior_design/views/workout_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginView());
      case RoutesName.profile:
        return MaterialPageRoute(builder: (context) => ProfileView());
      case RoutesName.workout:
        return MaterialPageRoute(builder: (context) => WorkoutView());
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
