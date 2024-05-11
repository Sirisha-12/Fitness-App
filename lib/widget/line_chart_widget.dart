import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                String text2 = '';
                switch (value.toInt()) {
                  case 1:
                    text2 = '100';
                    break;
                  case 3:
                    text2 = '300';
                    break;
                  case 5:
                    text2 = '500';
                    break;
                }
                return Text(text2);
              },
            ),
          ),
        ),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 8,
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 2.5),
              const FlSpot(2, 7),
              const FlSpot(4, 3),
              const FlSpot(6, 2.5),
              const FlSpot(8, 4),
              const FlSpot(10, 3),
              const FlSpot(10.5, 6),
            ],
            show: true,
            isCurved: true,
            barWidth: 3,
          )
        ]));
  }
}

SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 1:
            text = 'Mon';
            break;
          case 4:
            text = 'Thu';
            break;
          case 7:
            text = 'Sat';
            break;
          case 10:
            text = 'Tue';
            break;
        }
        return Text(text);
      },
    );
