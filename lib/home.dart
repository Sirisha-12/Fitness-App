import 'package:fitness_app/widget/exercises_widget.dart';
import 'package:fitness_app/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [buildAppBar(context), const ExercisesWidget()],
      ),
    );
  }

  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
        backgroundColor: Colors.blue[100],
        flexibleSpace: const FlexibleSpaceBar(
          background: LineChartWidget(),
        ),
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text('Statistics'),
        pinned: true,
        expandedHeight: MediaQuery.of(context).size.height * 0.5,
        stretch: true,
        actions: const [
          Icon(
            Icons.person,
            size: 28,
          ),
          SizedBox(
            width: 12,
          )
        ],
      );
}
