import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/exceptions/failure.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';

import './project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final Database _database;

  ProjectRepositoryImpl({required Database database}) : _database = database;

  @override
  Future<void> register(final Project project) async {
    try {
      final connection = await _database.openConnection();

      await connection.writeTxn(() {
        return connection.projects.put(project);
      });
    } on IsarError catch (e, s) {
      const message = 'Erro ao cadastrar projeto';
      log(message, error: e, stackTrace: s);
      throw Failure(message: message);
    }
  }

  @override
  Future<Project> findById(int projectId) async {
    final connection = await _database.openConnection();
    final project = await connection.projects.get(projectId);

    if (project == null) {
      throw Failure(message: 'Projeto não encontrado $projectId');
    }

    return project;
  }

  @override
  Future<List<Project>> findByStatus(final ProjectStatus status) async {
    final connection = await _database.openConnection();

    return await connection.projects.filter().statusEqualTo(status).findAll();
  }

  @override
  Future<Project> addTask(final int projectId, final ProjectTask task) async {
    try {
      final connection = await _database.openConnection();
      final project = await findById(projectId);

      project.tasks.add(task);

      await connection.writeTxn(() async => await project.tasks.save());

      return project;
    } on IsarError catch (e, s) {
      const message = 'Erro ao salvar task';
      log(message, error: e, stackTrace: s);
      throw Failure(message: message);
    }
  }

  @override
  Future<void> finish(int projectId) async {
    try {
      final connection = await _database.openConnection();
      final project = await findById(projectId);

      project.status = ProjectStatus.finalizado;

      await connection
          .writeTxn(() async => await connection.projects.put(project));
    } on IsarError catch (e, s) {
      const message = 'Erro ao finalizar projeto';
      log(message, error: e, stackTrace: s);
      throw Failure(message: message);
    }
  }
}
