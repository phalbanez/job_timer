// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/job_timer_icons.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/project/controller/project_register_controller.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_appbar.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_pie_chat.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_task_tite.dart';
import 'package:job_timer/app/view_models/project_model.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;

  const ProjectDetailPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == ProjectRegisterStatus.failure) {
            AsukaSnackbar.alert('Erro interno').show();
          }
        },
        builder: (context, state) {
          final projectModel = state.projectModel;

          switch (state.status) {
            case ProjectDetailStatus.initial:
              return const Center(child: Text('Carregando projeto'));
            case ProjectDetailStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ProjectDetailStatus.complete:
              return _buildPrjectDetail(context, projectModel!);
            case ProjectDetailStatus.failure:
              if (projectModel != null) {
                return _buildPrjectDetail(context, projectModel);
              }

              return const Center(child: Text('Erro ao carregar projeto'));
          }
        },
      ),
    );
  }

  Widget _buildPrjectDetail(context, ProjectModel projectModel) {
    final totalTask = projectModel.tasks.fold<int>(0, (totalValue, task) {
      return totalValue += task.duration;
    });

    return CustomScrollView(
      slivers: [
        ProjectDetailAppbar(projectModel: projectModel),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: ProjectPieChat(
                projectEstimate: projectModel.estimate,
                totalTasks: totalTask,
              ),
            ),
            ...projectModel.tasks
                .map((task) => ProjectTaskTite(task: task))
                .toList(),
          ]),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Visibility(
                visible: projectModel.status != ProjectStatus.finalizado,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.finishProject();
                  },
                  icon: const Icon(JobTimerIcons.ok_circled2),
                  label: const Text('Finalizar Projeto'),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
