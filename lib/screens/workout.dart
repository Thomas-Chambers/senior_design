import 'package:flutter/cupertino.dart';

//page that says profile
class WorkoutTab extends StatefulWidget {
  const WorkoutTab({Key? key}) : super(key: key);

  @override
  State<WorkoutTab> createState() => _WorkoutTabState();
}

class _WorkoutTabState extends State<WorkoutTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Workout'),
    );
  }
}