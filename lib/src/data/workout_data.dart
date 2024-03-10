import 'package:workout_tracker/src/models/exercise_model.dart';

import '../models/workout_model.dart';

class WorkoutData {
  /*

    WORKOUT DATA STRUCTURE

    - this overall list contains the different workouts
    - each workout has a name, and list of exercises

  */

  List<Workout> workoutList = [
    // default workout
    Workout(
      name: 'Upper Body',
      exercises: [
        Exercise(
          name: 'Bicep Curls',
          weight: '18',
          reps: '10',
          sets: '3',
        ),
      ],
    )
  ];
}
