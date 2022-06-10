import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';

abstract class ProjectRepository {
  Future<void> register(final Project project);
  Future<Project> findById(final int projectId);
  Future<List<Project>> findByStatus(final ProjectStatus status);
  Future<Project> addTask(final int projectId, final ProjectTask task);
  Future<void> finish(final int projectId);
}
