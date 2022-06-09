import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/job_timer_icons.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_appbar.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_pie_chat.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_task_tite.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppbar(),
          SliverList(
            delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: ProjectPieChat(),
              ),
              const ProjectTaskTite(),
              const ProjectTaskTite(),
              const ProjectTaskTite(),
              const ProjectTaskTite(),
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(JobTimerIcons.ok_circled2),
                  label: const Text('Finalizar Projeto'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
