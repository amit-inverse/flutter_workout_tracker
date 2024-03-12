import 'package:hive/hive.dart';
import 'package:workout_tracker/src/datetime/date_time.dart';
import 'package:workout_tracker/src/models/exercise_model.dart';

import '../models/workout_model.dart';

class HiveDatabase {
  // reference our hive box
  final _myBox = Hive.box('workout_database');

  // check if there is already data stored, if not, record the start date
  bool previousDataExists() {
    if (_myBox.isEmpty) {
      print('Previous data does NOT exist');
      _myBox.put('START_DATE', todaysDateYYYYMMDD());
      return false;
    } else {
      print('Previous data does exist');
      return true;
    }
  }

  // return start date as yyyymmdd

  // write data

  // read data, and return a list of workouts

  // check if any exercise has been done

  // retunr completion status of a given date yyyymmdd
}

// converts workout objects into a list --> e.g. [ upperbody, lowerbody ]
List<String> convertObjectToWorkoutList(List<Workout> workouts) {
  List<String> workoutList = [
    // e.g. [ upperbody, lowerbody ]
  ];

  for (int i = 0; i < workouts.length; i++) {
    // in each workout, add the name, followed by lists of exercises
    workoutList.add(
      workouts[i].name,
    );
  }

  return workoutList;
}

// converts the exercises in a workout object into a list of strings
List<List<List<String>>> convertObjectToExerciseList(List<Workout> workouts) {
  List<List<List<String>>> exerciseList = [
    /*

    [
      Upper Body
      [ [biceps, 10kg, 10reps, 3sets], [triceps, 20kg, 10reps, 3sets] ]
      
      Lower Body
      [ [squats, 25kg, 10reps, 3sets], [legraise, 30kg, 10reps, 3sets], [calf, 30kg, 10reps, 3sets] ]
    ]

  */
  ];

  // go through each workout
  for (int i = 0; i < workouts.length; i++) {
    // get exercises from each workout
    List<Exercise> exercisesInWorkout = workouts[i].exercises;

    List<List<String>> individualWorkout = [
      // Upper Body
      // [ [biceps, 10kg, 10reps, 3sets], [triceps, 20kg, 10reps, 3sets] ]
    ];

    // go through each exercise in exerciseList
    for (int j = 0; j < exercisesInWorkout.length; j++) {
      List<String> individualExercise = [
        // [biceps, 10kg, 10reps, 3sets]
      ];

      individualExercise.addAll(
        [
          exercisesInWorkout[j].name,
          exercisesInWorkout[j].weight,
          exercisesInWorkout[j].reps,
          exercisesInWorkout[j].sets,
          exercisesInWorkout[j].isCompleted.toString(),
        ],
      );
      individualWorkout.add(individualExercise);
    }

    exerciseList.add(individualWorkout);
  }

  return exerciseList;
}
