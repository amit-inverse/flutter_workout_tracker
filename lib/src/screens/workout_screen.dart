import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  final String workoutName;

  const WorkoutScreen({
    super.key,
    required this.workoutName,
  });

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutName),
      ),
    );
  }
}
