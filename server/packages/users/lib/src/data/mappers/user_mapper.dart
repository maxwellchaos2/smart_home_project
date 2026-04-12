import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class UserMapper {
  static UserEntity toEntity({required UserModel from}) {
    return UserEntity(
      id: from.id,
      name: from.name,
      type: switch (from.type) {
        'admin' => UserType.admin,
        'user' => UserType.user,
        _ => throw Exception('Unknown user type: ${from.type}'),
      },
      projectsId: from.projectsId,
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      username: from.username,
      passwordHash: from.passwordHash,
      email: from.email,
    );
  }
}
