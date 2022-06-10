// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjectPieChat extends StatelessWidget {
  final int projectEstimate;
  final int totalTasks;

  const ProjectPieChat({
    Key? key,
    required this.projectEstimate,
    required this.totalTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final residual = (projectEstimate - totalTasks);

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.loose,
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                    value: totalTasks.toDouble(),
                    color: theme.primaryColor,
                    showTitle: true,
                    title: '${totalTasks}h',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                PieChartSectionData(
                  value: residual.toDouble(),
                  color: theme.primaryColorLight,
                  showTitle: true,
                  title: '${residual}h',
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '${projectEstimate}h',
              style: TextStyle(
                fontSize: 25,
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
