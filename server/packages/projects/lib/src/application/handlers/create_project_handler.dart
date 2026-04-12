import 'dart:convert';

import 'package:common/common.dart';
import 'package:projects/projects.dart';
import 'package:projects/src/application/application.dart';
import 'package:projects/src/application/mappers/create_project_request_mapper.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Future<Response> createProjectHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IProjectsRepository>();
  final currentUser = request.context['currentUser'] as UserEntity;

  final data = jsonDecode(await request.readAsString());
  final model = CreateProjectRequestModel.fromJson(data);

  final result = await repository.create(
    input: CreateProjectRequestMapper.toEntity(
      from: model,
      userId: currentUser.id,
    ),
  );
  final jsonResult = ProjectResponseMapper.toModel(from: result).toJson();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}
