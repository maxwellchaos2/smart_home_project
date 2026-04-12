import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:users/src/application/application.dart';
import 'package:users/src/domain/domain.dart';

Future<Response> userMeHandler(Request request) async {
  final currentUser = request.context['currentUser'] as UserEntity;
  return Response.ok(
    jsonEncode(UserResponseMapper.toModel(from: currentUser).toJson()),
    headers: {'content-type': 'application/json'},
  );
}
