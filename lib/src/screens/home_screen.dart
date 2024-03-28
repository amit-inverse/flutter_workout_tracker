import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/workout_data.dart';
import '../widgets/heat_map.dart';
import 'workout_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<WorkoutData>(context, listen: false).initializeWorkoutList();
  }

  // text controller
  final workoutNameController = TextEditingController();

  // create a new workout
  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create new workout'),
        content: TextField(
          controller: workoutNameController,
        ),
        actions: [
          // save button
          MaterialButton(
            onPressed: save,
            child: const Text('Save'),
          ),

          // cancel button
          MaterialButton(
            onPressed: cancel,
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  // save workout
  void save() {
    String newWorkoutName = workoutNameController.text;
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);

    // pop dialog box
    Navigator.pop(context);
    clear();
  }

  // cancel workout
  void cancel() {
    // pop dialog box
    Navigator.pop(context);
    clear();
  }

  // clear controllers
  void clear() {
    workoutNameController.clear();
  }

  // go to workout screen
  void goToWorkoutScreen(String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutScreen(
          workoutName: workoutName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: const Text('Workout Tracker'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: createNewWorkout,
            child: const Icon(Icons.add),
          ),
          body: ListView(
            children: [
              // HEAT MAP
              MyHeatMap(
                datasets: value.heatMapDataSet,
                startDateYYYYMMDD: value.getStartDate(),
              ),

              // WORKOUT LIST
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getWorkoutList().length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(value.getWorkoutList()[index].name),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () =>
                        goToWorkoutScreen(value.getWorkoutList()[index].name),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
