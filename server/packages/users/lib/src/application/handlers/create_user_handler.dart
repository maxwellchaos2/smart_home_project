import 'dart:convert';

import 'package:common/common.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import 'package:users/src/application/application.dart';
import 'package:users/src/domain/domain.dart';

Future<Response> createUserHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IUsersRepository>();

  final data = CreateUserRequestMapper.toEntity(
    from: CreateUserRequestModel.fromJson(
      jsonDecode(await request.readAsString()),
    ),
  );

  if (checkRequestIsAdmin(request) == false) {
    final tempToken = request.url.queryParameters['tempToken'];
    if (tempToken == null || tempToken.isEmpty) {
      return Response.forbidden(
        jsonEncode({'message': 'You are not allowed to create a user'}),
        headers: {'content-type': 'application/json'},
      );
    }
    final jwt = JWT.verify(
      tempToken,
      SecretKey(ENV.fromKey('JWT_SECRET_KEY')),
      checkExpiresIn: true,
    );
    if (jwt.payload['type'] != 'email_verification' ||
        jwt.payload['email'] != data.email ||
        data.type != UserType.user) {
      return Response.forbidden(
        jsonEncode({'message': 'You are not allowed to create a user'}),
        headers: {'content-type': 'application/json'},
      );
    }
  }

  final user = await repository.create(input: data);

  return Response.ok(
    jsonEncode(UserResponseMapper.toModel(from: user).toJson()),
    headers: {'content-type': 'application/json'},
  );
}
