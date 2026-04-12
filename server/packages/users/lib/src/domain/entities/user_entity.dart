import 'package:common/common.dart';
import 'package:users/src/domain/domain.dart';

part 'user_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required int id,
    required String name,
    required UserType type,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<int> projectsId,
    required String username,
    required String passwordHash,
    required String? email,
  }) = _UserEntity;

  bool get isAdmin => type == UserType.admin;
}
