import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:path_provider/path_provider.dart';

import './database.dart';

class DatabaseImpl implements Database {
  Isar? _databaseInstace;

  @override
  Future<Isar> openConnection() async {
    if (_databaseInstace == null) {
      final dir = await getApplicationSupportDirectory();
      _databaseInstace = await Isar.open(
        [ProjectTaskSchema, ProjectSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return _databaseInstace!;
  }

  Future<void> emptyDatabase() async {
    final connection = await openConnection();
    await connection.writeTxn(() async {
      await connection.clear();
    });
  }
}
