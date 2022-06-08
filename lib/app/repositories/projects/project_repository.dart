import 'package:job_timer/app/entities/project.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
}
