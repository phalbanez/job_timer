import 'package:job_timer/app/entities/project_task.dart';

class ProjectTaskModel {
  int? id;
  late String name;
  late int duration;

  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskModel.fromEntity(ProjectTask task) {
    return ProjectTaskModel(
      id: task.id,
      name: task.name,
      duration: task.duration,
    );
  }
}
