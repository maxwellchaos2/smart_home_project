import 'package:users/src/application/application.dart';
import 'package:users/src/domain/domain.dart';

abstract final class CreateUserRequestMapper {
  static UserInputEntity toEntity({required CreateUserRequestModel from}) {
    return UserInputEntity(
      name: from.name,
      type: switch (from.type) {
        'admin' => UserType.admin,
        'user' => UserType.user,
        _ => throw ArgumentError('Invalid user type: ${from.type}'),
      },
      username: from.username,
      password: from.password,
      email: from.email,
    );
  }
}
