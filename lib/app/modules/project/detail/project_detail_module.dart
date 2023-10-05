import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/modular/modular_bind_config_bloc.dart';
import 'package:job_timer/app/core_module.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/modules/project/detail/project_detail_page.dart';
import 'package:job_timer/app/view_models/project_model.dart';

class ProjectDetailModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(ProjectDetailController.new,
        config: ModularBindConfigBloc.config());
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) {
      final ProjectModel projectModel = r.args.data;

      return ProjectDetailPage(
          controller: Modular.get()..setProjectModel(projectModel));
    });
  }
}
