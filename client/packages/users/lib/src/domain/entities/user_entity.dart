import 'package:common/common.dart';

import 'user_type.dart';

part 'user_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required String name,
    required UserType type,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String username,
  }) = _UserEntity;
}
