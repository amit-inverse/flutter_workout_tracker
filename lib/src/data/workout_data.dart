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

  // get the list of workouts
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  // get length of a given workout
  int numberOfExercisesInWorkout(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    return relevantWorkout.exercises.length;
  }

  // add a workout
  void addWorkout(String name) {
    // add a new workout with a blank list of exercises
    workoutList.add(Workout(name: name, exercises: []));
  }

  // add an exercise to a workout
  void addExercise(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    // find the relevant workout
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    relevantWorkout.exercises.add(
        Exercise(name: exerciseName, weight: weight, reps: reps, sets: sets));
  }

  // check off exercise
  void checkOffExercise(String workoutName, String exerciseName) {
    // find the relevant workout and relevant exercise in that workout
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);

    // check off boolean to show user completed the exercise
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
  }

  // returns relevant workout object, given a workout name
  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);

    return relevantWorkout;
  }

  // returns relevant exercise object, given a exercise name
  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    // find the relevant workout first
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);

    // then find the relevant exercise for that workout
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);

    return relevantExercise;
  }
}
