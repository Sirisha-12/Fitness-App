import 'package:fitness_app/data/exercise_sets.dart';
import 'package:fitness_app/models/exercise_set.dart';
import 'package:fitness_app/widget/exercise_set_widget.dart';
import 'package:flutter/material.dart';

class ExercisesWidget extends StatefulWidget {
  const ExercisesWidget({super.key});

  @override
  State<ExercisesWidget> createState() => _ExercisesWidgetState();
}

class _ExercisesWidgetState extends State<ExercisesWidget> {
  ExerciseType selectedType = ExerciseType.low;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Exercise',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            buildDifficultyLevel(),
            const SizedBox(
              height: 8,
            ),
            buildWorkouts()
          ],
        ),
      ),
    );
  }

  Widget buildWorkouts() {
    return GestureDetector(
      onHorizontalDragEnd: swipeFunction,
      child: Column(
        children: exerciseSets
            .where((element) => element.exerciseType == selectedType)
            .map(
              (exerciseSet) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ExerciseSetWidget(exerciseSet: exerciseSet)),
            )
            .toList(),
      ),
    );
  }

  Widget buildDifficultyLevel() => Row(
        children: ExerciseType.values.map(
          (type) {
            final name = getExercisesName(type);
            final fontWeight =
                selectedType == type ? FontWeight.bold : FontWeight.normal;

            return Expanded(
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => selectedType = type),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      name,
                      style: TextStyle(fontWeight: fontWeight, fontSize: 16),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );

  void swipeFunction(DragEndDetails dragEndDetails) {
    final selectedIndex = ExerciseType.values.indexOf(selectedType);
    final hasNext = selectedIndex < ExerciseType.values.length;
    final hasPrevious = selectedIndex > 0;

    setState(() {
      if (dragEndDetails.primaryVelocity! < 0 && hasNext) {
        final nextType = ExerciseType.values[selectedIndex + 1];
        selectedType = nextType;
      }
      if (dragEndDetails.primaryVelocity! > 0 && hasPrevious) {
        final previousType = ExerciseType.values[selectedIndex - 1];
        selectedType = previousType;
      }
    });
  }
}
