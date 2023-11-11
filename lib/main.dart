import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:senior_design/screens/login1.dart';
import 'package:senior_design/screens/profile.dart';
import 'package:senior_design/screens/workout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _tabs = [
    Login1(), // see the HomeTab class below
    const WorkoutTab(), // see the WorkoutTab class below
    const ProfileTab() // see the SettingsTab class below
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      backgroundColor: CupertinoColors.systemBrown,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Demo'),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center), label: 'Workout'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          }),
      //add a bottom navigation bar
    );
  }
}
