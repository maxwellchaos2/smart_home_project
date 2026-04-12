import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class UserMapper {
  static UserEntity toEntity({required UserModel from}) {
    return UserEntity(
      name: from.name,
      type: switch (from.type) {
        'admin' => UserType.admin,
        'user' => UserType.user,
        'arduino' => UserType.arduino,
        _ => throw Exception('Unknown user type: ${from.type}'),
      },
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      username: from.username,
    );
  }
}
