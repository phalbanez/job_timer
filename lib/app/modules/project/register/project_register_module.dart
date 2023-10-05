import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/modular/modular_bind_config_bloc.dart';
import 'package:job_timer/app/core_module.dart';
import 'package:job_timer/app/modules/project/controller/project_register_controller.dart';
import 'package:job_timer/app/modules/project/register/project_register_page.dart';

class ProjectRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<ProjectRegisterController>(ProjectRegisterController.new,
        config: ModularBindConfigBloc.config());
  }

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (context) => ProjectRegisterPage(controller: Modular.get()));
  }
}
