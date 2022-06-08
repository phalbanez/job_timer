import 'package:bloc/bloc.dart';
import 'package:job_timer/app/services/projects/project_service.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  final ProjectService _projectService;

  ProjectRegisterController({required final ProjectService projectService})
      : _projectService = projectService,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    emit(ProjectRegisterStatus.loading);
  }
}
