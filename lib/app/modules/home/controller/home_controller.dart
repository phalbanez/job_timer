import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProjectService _projectService;

  HomeController({required ProjectService projectService})
      : _projectService = projectService,
        super(HomeState.initial());

  Future<void> loadProjects() async {
    filter(state.projectFilter);
  }

  Future<void> filter(ProjectStatus status) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading, projects: []));
      final projects = await _projectService.findByStatus(status);
      emit(
        state.copyWith(
            status: HomeStatus.complete,
            projects: projects,
            projectFilter: status),
      );

      log('LOG--> TESTE DE LOG');
    } catch (e, s) {
      const message = 'Erro ao buscar os projetos';
      log(message, error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  void updateList() => filter(state.projectFilter);
}
