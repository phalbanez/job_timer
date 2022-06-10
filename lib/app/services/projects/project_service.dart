import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/view_models/project_model.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';

abstract class ProjectService {
  Future<void> register(final ProjectModel projectModel);
  Future<ProjectModel> findById(final int projectId);
  Future<List<ProjectModel>> findByStatus(final ProjectStatus status);
  Future<ProjectModel> addTask(
      final int projectId, final ProjectTaskModel task);
  Future<void> finish(final int projectId);
}
