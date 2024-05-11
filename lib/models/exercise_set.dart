import 'package:fitness_app/models/exercise.dart';
import 'package:flutter/material.dart';

enum ExerciseType { low, med, hard }

String getExercisesName(ExerciseType type) {
  switch (type) {
    case ExerciseType.low:
      return 'Easy';

    case ExerciseType.med:
      return 'Medium';
    case ExerciseType.hard:
      return 'Hard';
    default:
      return 'All';
  }
}

class ExerciseSet {
  final String name;
  final List<Exercise> exercises;
  final String imageUrl;
  final ExerciseType exerciseType;
  final Color color;

  const ExerciseSet({
    required this.name,
    required this.exercises,
    required this.imageUrl,
    required this.exerciseType,
    required this.color,
  });

  String get totalDuration {
    final duration = exercises.fold(
      Duration.zero,
      (previous, element) => previous + element.duration,
    );

    return duration.inMinutes.toString();
  }
}
