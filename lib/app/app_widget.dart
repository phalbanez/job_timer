import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/app_config_ui.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Job Timer',
      // builder: asuka.builder,
      builder: Asuka.builder,
      theme: AppConfigUI.theme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
