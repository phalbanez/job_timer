import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/home_module.dart';
import 'package:job_timer/app/modules/login/login_module.dart';
import 'package:job_timer/app/modules/project/project_module.dart';
import 'package:job_timer/app/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => SplashPage());
    r.module('/login', module: LoginModule());
    r.module('/home', module: HomeModule());
    r.module('/project', module: ProjectModule());
  }
}
