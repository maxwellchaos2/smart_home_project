import 'dart:convert';

import 'package:common/common.dart';
import 'package:projects/projects.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:yandex_auth/yandex_auth.dart';

Future<Response> authByCodeHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final user = request.context['currentUser'] as UserEntity;

  final repository = locator.get<IYandexAuthRepository>();
  final projectsRepository = locator.get<IProjectsRepository>();

  final body = jsonDecode(await request.readAsString()) as Map;

  final code = body['code'];
  if (code == null) {
    return Response(400, body: 'Code is required');
  }

  final token = await repository.codeToToken(code: code);

  await repository.saveToken(
      input: token.copyWith(projectId: user.projectsId.first));
  await projectsRepository.updateYandexAuth(
    id: user.projectsId.first,
    hasYandexAuth: true,
  );

  return Response.ok('Success');
}
