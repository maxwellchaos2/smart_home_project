import 'package:common/common.dart';

part 'refresh_token_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class RefreshTokenEntity with _$RefreshTokenEntity {
  const RefreshTokenEntity._();

  const factory RefreshTokenEntity({
    required int id,
    required String refreshToken,
    required int userId,
    required DateTime expiresAt,
    required DateTime createdAt,
  }) = _RefreshTokenEntity;
}
