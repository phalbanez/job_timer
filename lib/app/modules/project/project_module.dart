import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/detail/project_detail_module.dart';
import 'package:job_timer/app/modules/project/register/project_register_module.dart';
import 'package:job_timer/app/modules/project/task/task_module.dart';

class ProjectModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/register', module: ProjectRegisterModule());
    r.module('/detail', module: ProjectDetailModule());
    r.module('/task', module: TaskModule());
  }
}
