import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/modular/modular_bind_config_bloc.dart';
import 'package:job_timer/app/core_module.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';
import 'package:job_timer/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeController>(HomeController.new,
        config: ModularBindConfigBloc.config());
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) {
      final controller = Modular.get<HomeController>()..loadProjects();

      return HomePage(controller: controller);
    });
  }
}
