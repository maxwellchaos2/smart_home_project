import 'dart:convert';

import 'package:common/common.dart';
import 'package:projects/projects.dart';
import 'package:projects/src/application/application.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Future<Response> fetchMyProjectsHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IProjectsRepository>();
  final currentUser = request.context['currentUser'] as UserEntity;
  final projects = await repository.fetchAll(userId: currentUser.id);
  return Response.ok(
    jsonEncode(
      projects
          .map((project) =>
              ProjectResponseMapper.toModel(from: project).toJson())
          .toList(),
    ),
    headers: {'content-type': 'application/json'},
  );
}
