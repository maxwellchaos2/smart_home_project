import 'package:common/common.dart';
import 'package:users/src/domain/domain.dart';

part 'user_input_entity.freezed.dart';

@freezed
sealed class UserInputEntity with _$UserInputEntity {
  const factory UserInputEntity({
    required String name,
    required UserType type,
    required String username,
    required String password,
    required String? email,
  }) = _UserInputEntity;
}
