import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/database/database_impl.dart';
import 'package:job_timer/app/repositories/projects/project_repository.dart';
import 'package:job_timer/app/repositories/projects/project_repository_impl.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';
import 'package:job_timer/app/services/auth/auth_service_impl.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/services/projects/project_service_impl.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton<Database>(DatabaseImpl.new);
    i.addLazySingleton<AuthService>(AuthServiceImpl.new);
    i.addLazySingleton<ProjectRepository>(ProjectRepositoryImpl.new);
    i.addLazySingleton<ProjectService>(ProjectServiceImpl.new);
  }
}
