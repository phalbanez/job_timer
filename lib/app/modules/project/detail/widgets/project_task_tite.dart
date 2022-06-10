// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';

class ProjectTaskTite extends StatelessWidget {
  final ProjectTaskModel task;

  const ProjectTaskTite({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.name),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Duração',
                  style: TextStyle(color: Colors.grey),
                ),
                const TextSpan(text: '    '),
                TextSpan(
                  text: '${task.duration}h(s)',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
