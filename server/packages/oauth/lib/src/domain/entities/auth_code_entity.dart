import 'package:common/common.dart';

part 'auth_code_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class AuthCodeEntity with _$AuthCodeEntity {
  const AuthCodeEntity._();

  const factory AuthCodeEntity({
    required String code,
    required String clientId,
    required int userId,
    required DateTime expiresAt,
  }) = _AuthCodeEntity;
}
