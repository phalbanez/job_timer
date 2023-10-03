import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';

part 'project.g.dart';

@Collection()
class Project {
  Id? id;
  late String name;
  late int estimate;
  @Enumerated(EnumType.name)
  late ProjectStatus status;

  final tasks = IsarLinks<ProjectTask>();
}
