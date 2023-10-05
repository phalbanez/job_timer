import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/modular/modular_bind_config_bloc.dart';
import 'package:job_timer/app/core_module.dart';
import 'package:job_timer/app/modules/login/controller/login_controller.dart';
import 'package:job_timer/app/modules/login/login_page.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<LoginController>(LoginController.new,
        config: ModularBindConfigBloc.config());
  }

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (context) =>
            LoginPage(controller: Modular.get<LoginController>()));
  }
}
