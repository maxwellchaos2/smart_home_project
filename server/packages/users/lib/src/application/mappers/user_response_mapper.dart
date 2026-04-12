import 'package:users/src/application/application.dart';

import '/src/domain/domain.dart';

abstract final class UserResponseMapper {
  static UserResponseModel toModel({required UserEntity from}) {
    return UserResponseModel(
      name: from.name,
      type: switch (from.type) {
        UserType.admin => 'admin',
        UserType.user => 'user',
      },
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      username: from.username,
      email: from.email,
      projectsId: from.projectsId,
    );
  }
}
